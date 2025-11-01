#!/bin/bash

echo "📊 NDC Schema Browser - Populating RDS Databases"
echo "==============================================="

# Check if CloudFormation stack is complete
echo "🔍 Checking CloudFormation stack status..."
STACK_STATUS=$(aws cloudformation describe-stacks --stack-name ndc-schema-databases --query 'Stacks[0].StackStatus' --output text 2>/dev/null)

if [ "$STACK_STATUS" != "CREATE_COMPLETE" ]; then
    echo "⏳ Waiting for CloudFormation stack to complete..."
    aws cloudformation wait stack-create-complete --stack-name ndc-schema-databases
    
    if [ $? -ne 0 ]; then
        echo "❌ CloudFormation stack creation failed!"
        exit 1
    fi
fi

echo "✅ CloudFormation stack is ready!"

# Get database endpoints
echo "🔗 Getting database endpoints..."
LEGACY_ENDPOINT=$(aws cloudformation describe-stacks \
    --stack-name ndc-schema-databases \
    --query 'Stacks[0].Outputs[?OutputKey==`LegacyDatabaseEndpoint`].OutputValue' \
    --output text)

NDC_PLUS_ENDPOINT=$(aws cloudformation describe-stacks \
    --stack-name ndc-schema-databases \
    --query 'Stacks[0].Outputs[?OutputKey==`NDCPlusDatabaseEndpoint`].OutputValue' \
    --output text)

echo "   Legacy DB Endpoint: $LEGACY_ENDPOINT"
echo "   NDC Plus DB Endpoint: $NDC_PLUS_ENDPOINT"

# Wait for databases to be available
echo "⏳ Waiting for databases to become available..."
aws rds wait db-instance-available --db-instance-identifier ndc-legacy-schema
aws rds wait db-instance-available --db-instance-identifier ndc-plus-schema

echo "✅ Both databases are now available!"

# Set connection variables
DB_USER=schemaadmin
DB_PASS=SchemaTest2024!

# Test connections
echo "🔍 Testing database connections..."
export PGPASSWORD=$DB_PASS

psql -h $LEGACY_ENDPOINT -U $DB_USER -d legacy_schema -c "SELECT version();" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Legacy database connection successful"
else
    echo "❌ Legacy database connection failed"
    exit 1
fi

psql -h $NDC_PLUS_ENDPOINT -U $DB_USER -d ndc_plus_schema -c "SELECT version();" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ NDC Plus database connection successful"
else
    echo "❌ NDC Plus database connection failed"
    exit 1
fi

# Convert and import schemas
echo "🔄 Converting Oracle schemas to PostgreSQL..."
python3 aws/convert_schemas.py

if [ $? -ne 0 ]; then
    echo "❌ Schema conversion failed!"
    exit 1
fi

echo "📥 Importing Legacy schema to RDS..."
psql -h $LEGACY_ENDPOINT -U $DB_USER -d legacy_schema -f aws/legacy_schema.sql

if [ $? -ne 0 ]; then
    echo "❌ Legacy schema import failed!"
    exit 1
fi

echo "📥 Importing NDC PLUS schema to RDS..."
psql -h $NDC_PLUS_ENDPOINT -U $DB_USER -d ndc_plus_schema -f aws/ndc_plus_schema.sql

if [ $? -ne 0 ]; then
    echo "❌ NDC PLUS schema import failed!"
    exit 1
fi

echo "🔗 Adding foreign key relationships to Legacy schema..."
# Update the legacy relationships script with RDS connection details
sed "s/\\\\c legacy_schema;/-- Connect to RDS database/g" aws/add-legacy-relationships.sql > aws/add-legacy-relationships-rds.sql
psql -h $LEGACY_ENDPOINT -U $DB_USER -d legacy_schema -f aws/add-legacy-relationships-rds.sql

echo "🔗 Adding foreign key relationships to NDC PLUS schema..."
# Update the NDC PLUS relationships script with RDS connection details  
sed "s/\\\\c ndc_plus_schema;/-- Connect to RDS database/g" aws/add-ndc-plus-relationships-corrected.sql > aws/add-ndc-plus-relationships-rds.sql
psql -h $NDC_PLUS_ENDPOINT -U $DB_USER -d ndc_plus_schema -f aws/add-ndc-plus-relationships-rds.sql

# Verify table counts
echo "📊 Verifying imported data..."
LEGACY_TABLES=$(psql -h $LEGACY_ENDPOINT -U $DB_USER -d legacy_schema -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema='public';" | tr -d ' ')
NDC_PLUS_TABLES=$(psql -h $NDC_PLUS_ENDPOINT -U $DB_USER -d ndc_plus_schema -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema='public';" | tr -d ' ')

echo "   Legacy schema: $LEGACY_TABLES tables imported"
echo "   NDC PLUS schema: $NDC_PLUS_TABLES tables imported"

# Save connection details for documentation generation
cat > aws/rds-connection-info.txt << EOF
# RDS Connection Information
LEGACY_DB_HOST=$LEGACY_ENDPOINT
NDC_PLUS_DB_HOST=$NDC_PLUS_ENDPOINT
DB_USER=$DB_USER
DB_PASS=$DB_PASS
EOF

echo ""
echo "🎉 RDS database population completed successfully!"
echo ""
echo "Database Details:"
echo "   Legacy Schema: $LEGACY_TABLES tables at $LEGACY_ENDPOINT"
echo "   NDC PLUS Schema: $NDC_PLUS_TABLES tables at $NDC_PLUS_ENDPOINT"
echo ""
echo "Next step: Run ./aws/generate-live-docs-rds.sh to generate documentation"