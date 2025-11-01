#!/bin/bash

# Schema Setup Script for NDC Database Browser
# Imports PostgreSQL schemas into AWS RDS instances

set -e  # Exit on any error

# Configuration
ENV_FILE="aws/database-connections.env"

echo "🗄️ NDC Schema Setup"
echo "==================="

# Check if environment file exists
if [ ! -f "$ENV_FILE" ]; then
    echo "❌ Database connection file not found: $ENV_FILE"
    echo "💡 Please run './aws/deploy-databases.sh' first to create databases"
    exit 1
fi

# Load database connection details
source "$ENV_FILE"

echo "✅ Database connection details loaded"

# Check if psql is installed
if ! command -v psql &> /dev/null; then
    echo "❌ PostgreSQL client (psql) is not installed."
    echo "📦 Install it with:"
    echo "   macOS: brew install postgresql"
    echo "   Ubuntu: sudo apt-get install postgresql-client"
    echo "   Windows: Download from https://www.postgresql.org/download/"
    exit 1
fi

echo "✅ PostgreSQL client found"

# Function to wait for database availability
wait_for_database() {
    local connection_string=$1
    local db_name=$2
    local max_attempts=30
    local attempt=1
    
    echo "⏳ Waiting for $db_name database to be available..."
    
    while [ $attempt -le $max_attempts ]; do
        if psql "$connection_string" -c "SELECT 1;" >/dev/null 2>&1; then
            echo "✅ $db_name database is available"
            return 0
        fi
        
        echo "   Attempt $attempt/$max_attempts - waiting 30 seconds..."
        sleep 30
        ((attempt++))
    done
    
    echo "❌ $db_name database not available after $(($max_attempts * 30)) seconds"
    return 1
}

# Function to import schema
import_schema() {
    local connection_string=$1
    local schema_file=$2
    local db_name=$3
    
    echo "📥 Importing $db_name schema from $schema_file..."
    
    if [ ! -f "$schema_file" ]; then
        echo "❌ Schema file not found: $schema_file"
        return 1
    fi
    
    if psql "$connection_string" -f "$schema_file"; then
        echo "✅ $db_name schema imported successfully"
        return 0
    else
        echo "❌ Failed to import $db_name schema"
        return 1
    fi
}

# Function to verify schema import
verify_schema() {
    local connection_string=$1
    local db_name=$2
    
    echo "🔍 Verifying $db_name schema..."
    
    table_count=$(psql "$connection_string" -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';" | tr -d ' ')
    
    echo "   Tables created: $table_count"
    
    if [ "$table_count" -gt 0 ]; then
        echo "✅ $db_name schema verification passed"
        
        # List tables
        echo "   📋 Tables in $db_name:"
        psql "$connection_string" -c "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name;" | grep -v "table_name" | grep -v "^-" | grep -v "^(" | grep -v "^$" | sed 's/^/      • /'
        
        return 0
    else
        echo "❌ $db_name schema verification failed - no tables found"
        return 1
    fi
}

echo ""
echo "🏛️ Setting up Legacy Schema Database..."
echo "======================================="

# Wait for Legacy database
if wait_for_database "$LEGACY_CONNECTION_STRING" "Legacy"; then
    # Import Legacy schema
    if import_schema "$LEGACY_CONNECTION_STRING" "aws/legacy_schema.sql" "Legacy"; then
        verify_schema "$LEGACY_CONNECTION_STRING" "Legacy"
    fi
else
    echo "❌ Cannot connect to Legacy database. Please check if RDS instance is running."
    exit 1
fi

echo ""
echo "🚀 Setting up NDC PLUS Schema Database..."
echo "========================================"

# Wait for NDC PLUS database
if wait_for_database "$NDCPLUS_CONNECTION_STRING" "NDC PLUS"; then
    # Import NDC PLUS schema
    if import_schema "$NDCPLUS_CONNECTION_STRING" "aws/ndc_plus_schema.sql" "NDC PLUS"; then
        verify_schema "$NDCPLUS_CONNECTION_STRING" "NDC PLUS"
    fi
else
    echo "❌ Cannot connect to NDC PLUS database. Please check if RDS instance is running."
    exit 1
fi

echo ""
echo "🎉 Schema Setup Complete!"
echo "========================"
echo "✅ Legacy Schema: $(psql "$LEGACY_CONNECTION_STRING" -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';" | tr -d ' ') tables"
echo "✅ NDC PLUS Schema: $(psql "$NDCPLUS_CONNECTION_STRING" -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';" | tr -d ' ') tables"
echo ""
echo "🔗 Database Connections:"
echo "   Legacy: $LEGACY_CONNECTION_STRING"
echo "   NDC PLUS: $NDCPLUS_CONNECTION_STRING"
echo ""
echo "⏭️  Next Steps:"
echo "==============="
echo "1. Run './aws/setup-schemaspy.sh' to install SchemaSpy"
echo "2. Run './aws/generate-live-docs.sh' to create live documentation"
echo "3. View your live schema browser in the updated website"
echo ""
echo "💡 Test connections manually:"
echo "   psql \"$LEGACY_CONNECTION_STRING\""
echo "   psql \"$NDCPLUS_CONNECTION_STRING\""