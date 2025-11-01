#!/bin/bash

echo "🚀 NDC Schema Browser - AWS RDS Deployment"
echo "==========================================="

# Wait for CloudFormation stack to complete
echo "⏳ Waiting for RDS stack creation to complete..."
aws cloudformation wait stack-create-complete --stack-name ndc-schema-databases

if [ $? -ne 0 ]; then
    echo "❌ CloudFormation stack creation failed!"
    exit 1
fi

echo "✅ CloudFormation stack created successfully!"

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

# Set environment variables for connection
export LEGACY_DB_HOST=$LEGACY_ENDPOINT
export NDC_PLUS_DB_HOST=$NDC_PLUS_ENDPOINT
export DB_USER=schemaadmin
export DB_PASS=SchemaTest2024!

# Test connections
echo "🔍 Testing database connections..."
psql -h $LEGACY_DB_HOST -U $DB_USER -d legacy_schema -c "SELECT version();" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Legacy database connection successful"
else
    echo "❌ Legacy database connection failed"
fi

psql -h $NDC_PLUS_DB_HOST -U $DB_USER -d ndc_plus_schema -c "SELECT version();" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ NDC Plus database connection successful"
else
    echo "❌ NDC Plus database connection failed"
fi

echo ""
echo "🎉 AWS RDS deployment completed!"
echo ""
echo "Database Connection Details:"
echo "   Legacy Schema: host=$LEGACY_DB_HOST dbname=legacy_schema user=$DB_USER"
echo "   NDC Plus Schema: host=$NDC_PLUS_DB_HOST dbname=ndc_plus_schema user=$DB_USER"
echo ""
echo "Next steps:"
echo "1. Run ./aws/populate-rds-schemas.sh to import schema data"
echo "2. Run ./aws/generate-live-docs-rds.sh to generate documentation"