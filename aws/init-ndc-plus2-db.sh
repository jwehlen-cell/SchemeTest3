#!/bin/bash
# Initialize NDC PLUS 2 Schema Database

DB_HOST="$1"
DB_USER="$2"
DB_PASS="$3"
DB_NAME="ndc_plus2_schema"

if [ -z "$DB_HOST" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASS" ]; then
    echo "Usage: $0 <db_host> <db_user> <db_password>"
    echo "Example: $0 ndc-plus2-schema.c0320kayk04f.us-east-1.rds.amazonaws.com schemaadmin 'SchemaTest2024!'"
    exit 1
fi

echo "🚀 Initializing NDC PLUS 2 Schema Database..."
echo "   Host: $DB_HOST"
echo "   User: $DB_USER"
echo "   Database: $DB_NAME"

# Connection string
CONNECTION_STRING="postgresql://$DB_USER:$DB_PASS@$DB_HOST:5432/$DB_NAME"

echo "📋 Creating schema tables..."
if psql "$CONNECTION_STRING" -f ../NDCPlus2.ddl; then
    echo "✅ NDC PLUS 2 schema tables created successfully!"
else
    echo "❌ Failed to create NDC PLUS 2 schema tables"
    exit 1
fi

echo "📊 Inserting sample data..."
if psql "$CONNECTION_STRING" -f ndc_plus2_sample_data.sql; then
    echo "✅ Sample data inserted successfully!"
else
    echo "⚠️  Warning: Failed to insert sample data (this is optional)"
fi

echo "🔍 Verifying schema creation..."
TABLES=$(psql "$CONNECTION_STRING" -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema = 'public';")
echo "   Tables created: $TABLES"

if [ "$TABLES" -gt 0 ]; then
    echo "✅ NDC PLUS 2 database initialization completed successfully!"
    echo ""
    echo "📋 Connection details:"
    echo "   Database: $DB_NAME"
    echo "   Host: $DB_HOST"
    echo "   Port: 5432"
    echo "   Username: $DB_USER"
    echo ""
    echo "🔗 Connection string:"
    echo "   $CONNECTION_STRING"
else
    echo "❌ Database initialization failed - no tables found"
    exit 1
fi