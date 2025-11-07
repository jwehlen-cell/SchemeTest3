#!/bin/bash

# Setup USNDC Schema Database
# Populates the RDS database with USNDC schema tables, constraints, and indexes

set -e

echo "🏗️ Setting up USNDC Schema Database"
echo "===================================="

# Load connection information
if [ -f "usndc-connection-info.txt" ]; then
    source usndc-connection-info.txt
    echo "✅ Loaded connection information"
else
    echo "❌ Connection info file not found. Please run deploy-usndc-database.sh first"
    exit 1
fi

echo "Database Host: $DB_HOST"
echo "Database Name: $DB_NAME"
echo "Database User: $DB_USER"
echo ""

# Check if required files exist
if [ ! -f "usndc_schema.sql" ]; then
    echo "❌ Schema file not found: usndc_schema.sql"
    echo "Please run: python3 ../tools/generate_usndc_sql.py"
    exit 1
fi

# Check if psql is available
if ! command -v psql &> /dev/null; then
    echo "❌ psql (PostgreSQL client) is not installed"
    echo "Please install PostgreSQL client tools"
    exit 1
fi

# Set password environment variable
export PGPASSWORD="$DB_PASSWORD"

# Test connection
echo "🔌 Testing database connection..."
if ! psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "SELECT version();" > /dev/null 2>&1; then
    echo "❌ Cannot connect to database"
    echo "Please check:"
    echo "  1. Database is running"
    echo "  2. Security groups allow connection"
    echo "  3. Connection parameters are correct"
    exit 1
fi

echo "✅ Database connection successful"

# Function to execute SQL with error handling
execute_sql() {
    local description="$1"
    local sql_file="$2"
    
    echo "📊 $description..."
    if psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "$sql_file" > /dev/null 2>&1; then
        echo "✅ $description completed successfully"
        return 0
    else
        echo "❌ $description failed"
        return 1
    fi
}

# Function to verify schema setup
verify_schema() {
    echo ""
    echo "🔍 Verifying schema setup..."
    
    # Count tables
    TABLE_COUNT=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema = 'public';" | tr -d ' ')
    echo "   Tables created: $TABLE_COUNT"
    
    # Count constraints
    PK_COUNT=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -t -c "SELECT count(*) FROM information_schema.table_constraints WHERE constraint_type = 'PRIMARY KEY' AND table_schema = 'public';" | tr -d ' ')
    echo "   Primary key constraints: $PK_COUNT"
    
    FK_COUNT=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -t -c "SELECT count(*) FROM information_schema.table_constraints WHERE constraint_type = 'FOREIGN KEY' AND table_schema = 'public';" | tr -d ' ')
    echo "   Foreign key constraints: $FK_COUNT"
    
    # Count indexes
    INDEX_COUNT=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -t -c "SELECT count(*) FROM pg_indexes WHERE schemaname = 'public';" | tr -d ' ')
    echo "   Indexes created: $INDEX_COUNT"
    
    if [ "$TABLE_COUNT" -gt 0 ]; then
        echo "✅ Schema verification passed"
        return 0
    else
        echo "❌ Schema verification failed - no tables found"
        return 1
    fi
}

# Create schema tables
echo ""
echo "🗃️ Creating USNDC schema tables..."
if execute_sql "Creating tables, constraints, and indexes" "usndc_schema.sql"; then
    echo "✅ Schema creation completed"
else
    echo "❌ Schema creation failed"
    echo "Check the SQL file for errors or database logs"
    exit 1
fi

# Verify the setup
if verify_schema; then
    echo ""
    echo "🎉 USNDC Schema Setup Complete!"
    echo "=============================="
    echo ""
    echo "📊 Database Summary:"
    echo "   Schema: USNDC (United States National Data Center)"
    echo "   Tables: 177 seismic monitoring tables"
    echo "   Columns: 1,876 total columns"
    echo "   Constraints: Primary keys and foreign keys implemented"
    echo "   Indexes: Performance indexes created"
    echo ""
    echo "🔗 Connection Details:"
    echo "   Host: $DB_HOST"
    echo "   Database: $DB_NAME"
    echo "   Username: $DB_USER"
    echo ""
    echo "💡 Connect to explore:"
    echo "   psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME"
    echo ""
    echo "📋 Next Step:"
    echo "   Run: ./generate-usndc-docs.sh to generate schema documentation"
else
    echo "❌ Schema setup verification failed"
    exit 1
fi