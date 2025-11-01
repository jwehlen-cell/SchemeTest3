#!/bin/bash

# SchemaSpy Setup and Live Documentation Generator
# Generates interactive HTML documentation from PostgreSQL databases

set -e  # Exit on any error

# Configuration
ENV_FILE="aws/database-connections.env"
SCHEMASPY_VERSION="6.2.4"
SCHEMASPY_JAR="aws/schemaspy-${SCHEMASPY_VERSION}.jar"
SCHEMASPY_URL="https://github.com/schemaspy/schemaspy/releases/download/v${SCHEMASPY_VERSION}/schemaspy-${SCHEMASPY_VERSION}.jar"
POSTGRES_DRIVER_URL="https://jdbc.postgresql.org/download/postgresql-42.7.1.jar"
POSTGRES_DRIVER_JAR="aws/postgresql-42.7.1.jar"

echo "🔧 SchemaSpy Setup and Documentation Generator"
echo "=============================================="

# Check if environment file exists
if [ ! -f "$ENV_FILE" ]; then
    echo "❌ Database connection file not found: $ENV_FILE"
    echo "💡 Please run './aws/deploy-databases.sh' first to create databases"
    exit 1
fi

# Load database connection details
source "$ENV_FILE"
echo "✅ Database connection details loaded"

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. SchemaSpy requires Java 8 or higher."
    echo "📦 Install Java:"
    echo "   macOS: brew install openjdk"
    echo "   Ubuntu: sudo apt-get install openjdk-11-jdk"
    echo "   Windows: Download from https://adoptium.net/"
    exit 1
fi

echo "✅ Java found: $(java -version 2>&1 | head -n 1)"

# Create output directories
mkdir -p aws/schemaspy-output/legacy
mkdir -p aws/schemaspy-output/ndc-plus
mkdir -p deploy-live/live-docs

# Download SchemaSpy if not exists
if [ ! -f "$SCHEMASPY_JAR" ]; then
    echo "📥 Downloading SchemaSpy ${SCHEMASPY_VERSION}..."
    curl -L "$SCHEMASPY_URL" -o "$SCHEMASPY_JAR"
    echo "✅ SchemaSpy downloaded"
else
    echo "✅ SchemaSpy already downloaded"
fi

# Download PostgreSQL JDBC driver if not exists
if [ ! -f "$POSTGRES_DRIVER_JAR" ]; then
    echo "📥 Downloading PostgreSQL JDBC driver..."
    curl -L "$POSTGRES_DRIVER_URL" -o "$POSTGRES_DRIVER_JAR"
    echo "✅ PostgreSQL driver downloaded"
else
    echo "✅ PostgreSQL driver already downloaded"
fi

# Function to generate documentation for a database
generate_docs() {
    local db_endpoint=$1
    local db_name=$2
    local db_username=$3
    local db_password=$4
    local output_dir=$5
    local schema_type=$6
    
    echo ""
    echo "📊 Generating $schema_type documentation..."
    echo "Database: $db_name at $db_endpoint"
    echo "Output: $output_dir"
    
    # Clear previous output
    rm -rf "$output_dir"
    mkdir -p "$output_dir"
    
    # Run SchemaSpy
    java -jar "$SCHEMASPY_JAR" \
        -t pgsql \
        -dp "$POSTGRES_DRIVER_JAR" \
        -host "$db_endpoint" \
        -port 5432 \
        -db "$db_name" \
        -u "$db_username" \
        -p "$db_password" \
        -o "$output_dir" \
        -s public \
        -norows \
        -noimplied \
        -vizjs
    
    if [ $? -eq 0 ]; then
        echo "✅ $schema_type documentation generated successfully"
        
        # Count tables documented
        table_count=$(find "$output_dir/tables" -name "*.html" 2>/dev/null | wc -l | tr -d ' ')
        echo "   📋 Tables documented: $table_count"
        
        # Copy to deployment folder with schema prefix
        cp -r "$output_dir" "deploy-live/live-docs/${schema_type,,}"
        echo "   📤 Copied to live deployment folder"
        
        return 0
    else
        echo "❌ Failed to generate $schema_type documentation"
        return 1
    fi
}

echo ""
echo "🏛️ Generating Legacy Schema Documentation..."
echo "==========================================="

if generate_docs "$LEGACY_DB_ENDPOINT" "$LEGACY_DB_NAME" "$LEGACY_DB_USERNAME" "$LEGACY_DB_PASSWORD" "aws/schemaspy-output/legacy" "Legacy"; then
    LEGACY_SUCCESS=true
else
    LEGACY_SUCCESS=false
fi

echo ""
echo "🚀 Generating NDC PLUS Schema Documentation..."
echo "============================================="

if generate_docs "$NDCPLUS_DB_ENDPOINT" "$NDCPLUS_DB_NAME" "$NDCPLUS_DB_USERNAME" "$NDCPLUS_DB_PASSWORD" "aws/schemaspy-output/ndc-plus" "NDC-Plus"; then
    NDCPLUS_SUCCESS=true
else
    NDCPLUS_SUCCESS=false
fi

echo ""
echo "📋 Documentation Generation Summary:"
echo "===================================="
echo "Legacy Schema: $([ "$LEGACY_SUCCESS" = true ] && echo "✅ Success" || echo "❌ Failed")"
echo "NDC PLUS Schema: $([ "$NDCPLUS_SUCCESS" = true ] && echo "✅ Success" || echo "❌ Failed")"

if [ "$LEGACY_SUCCESS" = true ] && [ "$NDCPLUS_SUCCESS" = true ]; then
    echo ""
    echo "🎉 Live documentation generated successfully!"
    echo "============================================"
    echo ""
    echo "📁 Documentation locations:"
    echo "   Repository:"
    echo "      • aws/schemaspy-output/legacy/index.html"
    echo "      • aws/schemaspy-output/ndc-plus/index.html"
    echo "   Deployment:"
    echo "      • deploy-live/live-docs/legacy/index.html"
    echo "      • deploy-live/live-docs/ndc-plus/index.html"
    echo ""
    echo "🌐 Live documentation features:"
    echo "   • Interactive ER diagrams"
    echo "   • Table relationship explorer"
    echo "   • Column details and constraints"
    echo "   • Orphan table detection"
    echo "   • Database statistics"
    echo ""
    echo "⏭️  Next Steps:"
    echo "==============="
    echo "1. Open local documentation to preview:"
    echo "   open aws/schemaspy-output/legacy/index.html"
    echo "   open aws/schemaspy-output/ndc-plus/index.html"
    echo ""
    echo "2. Run './deploy-live/deploy.sh' to update live website"
    echo "3. View live documentation at the separate live database browser"
    
    # Create quick access script
    cat > aws/view-docs.sh << 'EOF'
#!/bin/bash
echo "🔍 Opening SchemaSpy Documentation..."
if command -v open &> /dev/null; then
    # macOS
    open aws/schemaspy-output/legacy/index.html
    open aws/schemaspy-output/ndc-plus/index.html
elif command -v xdg-open &> /dev/null; then
    # Linux
    xdg-open aws/schemaspy-output/legacy/index.html
    xdg-open aws/schemaspy-output/ndc-plus/index.html
else
    echo "📍 Documentation locations:"
    echo "   Legacy: $(pwd)/aws/schemaspy-output/legacy/index.html"
    echo "   NDC PLUS: $(pwd)/aws/schemaspy-output/ndc-plus/index.html"
fi
EOF
    chmod +x aws/view-docs.sh
    
    echo ""
    echo "💡 Quick access: ./aws/view-docs.sh"
    
else
    echo ""
    echo "❌ Documentation generation had errors. Please check:"
    echo "   • Database connectivity"
    echo "   • Java installation" 
    echo "   • Network access to RDS instances"
    echo ""
    echo "🔧 Troubleshooting:"
    echo "   • Check database status: aws rds describe-db-instances"
    echo "   • Test connection: psql \"$LEGACY_CONNECTION_STRING\""
    echo "   • Verify Java: java -version"
fi