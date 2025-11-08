#!/bin/bash

# Simple database connection test
export PGPASSWORD="SchemaTest2024!"

echo "Testing connection..."
psql -h usndc-schema-usndc-schematest3-clone.c0320kayk04f.us-east-1.rds.amazonaws.com \
     -p 5432 \
     -U schemaadmin \
     -d usndc_schema \
     -c "SELECT current_database(), current_user, version();"

echo "Checking existing tables..."
psql -h usndc-schema-usndc-schematest3-clone.c0320kayk04f.us-east-1.rds.amazonaws.com \
     -p 5432 \
     -U schemaadmin \
     -d usndc_schema \
     -c "SELECT count(*) as table_count FROM information_schema.tables WHERE table_schema = 'public';"