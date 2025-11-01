#!/bin/bash

# NDC Schema Browser - Local PostgreSQL Setup
# This creates local PostgreSQL databases for immediate testing

set -e  # Exit on any error

echo "🚀 NDC Schema Browser - Local PostgreSQL Setup"
echo "==============================================="
echo "Setting up local PostgreSQL databases for immediate testing..."
echo ""

# Check if PostgreSQL is running
if ! pg_isready -q 2>/dev/null; then
    echo "📦 Starting PostgreSQL service..."
    brew services start postgresql || {
        echo "❌ Failed to start PostgreSQL service"
        echo "💡 Try running: brew services restart postgresql"
        exit 1
    }
    sleep 3
fi

echo "✅ PostgreSQL is running"

# Database credentials
DB_USER="schemaadmin"
DB_PASSWORD="SchemaTest2024!"
LEGACY_DB="legacy_schema"
NDC_DB="ndc_plus_schema"

echo "🔧 Setting up databases and user..."

# Create user if it doesn't exist
psql postgres -c "SELECT 1 FROM pg_user WHERE usename = '$DB_USER'" | grep -q 1 || {
    echo "👤 Creating database user: $DB_USER"
    psql postgres -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD' CREATEDB;"
}

# Create databases
echo "🗄️  Creating databases..."
createdb -U $USER $LEGACY_DB 2>/dev/null || echo "Database $LEGACY_DB already exists"
createdb -U $USER $NDC_DB 2>/dev/null || echo "Database $NDC_DB already exists"

# Grant permissions
psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE $LEGACY_DB TO $DB_USER;"
psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE $NDC_DB TO $DB_USER;"

echo "🔄 Converting and importing schemas..."

# Convert Oracle schemas to PostgreSQL
echo "Converting Legacy schema..."
python3 aws/convert_schemas.py Legacy_tables.txt aws/legacy_schema.sql

echo "Converting NDC PLUS schema..."
python3 aws/convert_schemas.py NDC_PLUS_tables.txt aws/ndc_plus_schema.sql

# Import schemas
echo "📥 Importing Legacy schema..."
psql -U $DB_USER -d $LEGACY_DB -f aws/legacy_schema.sql -q

echo "📥 Importing NDC PLUS schema..."
psql -U $DB_USER -d $NDC_DB -f aws/ndc_plus_schema.sql -q

echo "✅ Schema import completed!"

# Test connections
echo "🔌 Testing database connections..."
psql "postgresql://$DB_USER:$DB_PASSWORD@localhost:5432/$LEGACY_DB" -c "SELECT count(*) as table_count FROM information_schema.tables WHERE table_schema = 'public';" || {
    echo "❌ Failed to connect to Legacy database"
    exit 1
}

psql "postgresql://$DB_USER:$DB_PASSWORD@localhost:5432/$NDC_DB" -c "SELECT count(*) as table_count FROM information_schema.tables WHERE table_schema = 'public';" || {
    echo "❌ Failed to connect to NDC PLUS database"
    exit 1
}

echo "✅ Database connections successful!"

# Create connection info file
cat > aws/local-db-info.txt << EOF
🗄️  Local PostgreSQL Database Information
=========================================

Legacy Schema Database:
  URL: postgresql://$DB_USER:$DB_PASSWORD@localhost:5432/$LEGACY_DB
  Host: localhost
  Port: 5432
  Database: $LEGACY_DB
  Username: $DB_USER
  Password: $DB_PASSWORD

NDC PLUS Schema Database:
  URL: postgresql://$DB_USER:$DB_PASSWORD@localhost:5432/$NDC_DB
  Host: localhost  
  Port: 5432
  Database: $NDC_DB
  Username: $DB_USER
  Password: $DB_PASSWORD

📊 To generate SchemaSpy documentation:
  ./aws/generate-live-docs-local.sh

🌐 Local database endpoints ready for SchemaSpy integration!
EOF

echo ""
echo "🎉 Local PostgreSQL setup completed successfully!"
echo ""
cat aws/local-db-info.txt
echo ""
echo "🏗️  Next: Run './aws/generate-live-docs-local.sh' to generate live documentation"