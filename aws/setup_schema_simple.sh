#!/bin/bash

# Setup USNDC Schema - Simplified Version
set -e

export PGPASSWORD="SchemaTest2024!"
DB_HOST="usndc-schema-usndc-schematest3-clone.c0320kayk04f.us-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_NAME="usndc_schema"
DB_USER="schemaadmin"

echo "🏗️ Setting up USNDC Schema Database"
echo "===================================="
echo "Host: $DB_HOST"
echo "Database: $DB_NAME"
echo "User: $DB_USER"
echo

# Test connection
echo "🔌 Testing database connection..."
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "SELECT current_database();"

if [ $? -eq 0 ]; then
    echo "✅ Database connection successful"
else
    echo "❌ Database connection failed"
    exit 1
fi

# Apply schema
echo
echo "📊 Applying USNDC schema..."
echo "This may take a few minutes..."

psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f usndc_schema.sql

if [ $? -eq 0 ]; then
    echo "✅ Schema applied successfully"
else
    echo "❌ Schema application failed"
    exit 1
fi

# Verify installation
echo
echo "🔍 Verifying schema installation..."
TABLE_COUNT=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema = 'public';" | tr -d ' ')
echo "Tables created: $TABLE_COUNT"

PK_COUNT=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -t -c "SELECT count(*) FROM information_schema.table_constraints WHERE constraint_type = 'PRIMARY KEY' AND table_schema = 'public';" | tr -d ' ')
echo "Primary key constraints: $PK_COUNT"

FK_COUNT=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -t -c "SELECT count(*) FROM information_schema.table_constraints WHERE constraint_type = 'FOREIGN KEY' AND table_schema = 'public';" | tr -d ' ')
echo "Foreign key constraints: $FK_COUNT"

if [ "$TABLE_COUNT" -gt 0 ]; then
    echo
    echo "🎉 USNDC Schema Setup Complete!"
    echo "==============================="
    echo
    echo "📊 Database Summary:"
    echo "   Tables: $TABLE_COUNT"
    echo "   Primary Keys: $PK_COUNT"  
    echo "   Foreign Keys: $FK_COUNT"
    echo
    echo "🔗 Connection:"
    echo "   psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME"
else
    echo "❌ No tables were created - check for errors above"
    exit 1
fi