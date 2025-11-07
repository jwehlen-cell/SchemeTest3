#!/bin/bash

# Deploy USNDC Database Infrastructure
# Creates RDS PostgreSQL database with proper networking and security

set -e

echo "🚀 Deploying USNDC Database Infrastructure"
echo "=========================================="

# Configuration
STACK_NAME="usndc-schematest3-clone"
REGION="us-east-1"
DB_USERNAME="schemaadmin"
DB_PASSWORD="SchemaTest2024!"

echo "Stack Name: $STACK_NAME"
echo "Region: $REGION"
echo "Database Username: $DB_USERNAME"
echo ""

# Check if AWS CLI is available
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI is not installed or not in PATH"
    exit 1
fi

# Check AWS credentials
echo "🔐 Checking AWS credentials..."
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "❌ AWS credentials not configured"
    echo "Please run: aws configure"
    exit 1
fi

echo "✅ AWS credentials verified"

# Deploy CloudFormation stack
echo ""
echo "☁️ Deploying CloudFormation stack..."
aws cloudformation deploy \
    --template-file usndc-database.yaml \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --parameter-overrides \
        DatabaseUsername="$DB_USERNAME" \
        DatabasePassword="$DB_PASSWORD" \
    --capabilities CAPABILITY_IAM \
    --no-fail-on-empty-changeset

if [ $? -eq 0 ]; then
    echo "✅ CloudFormation stack deployed successfully"
else
    echo "❌ CloudFormation deployment failed"
    exit 1
fi

# Get database endpoint
echo ""
echo "📊 Retrieving database information..."
DB_ENDPOINT=$(aws cloudformation describe-stacks \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --query 'Stacks[0].Outputs[?OutputKey==`USNDCDatabaseEndpoint`].OutputValue' \
    --output text)

DB_PORT=$(aws cloudformation describe-stacks \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --query 'Stacks[0].Outputs[?OutputKey==`USNDCDatabasePort`].OutputValue' \
    --output text)

if [ -z "$DB_ENDPOINT" ]; then
    echo "❌ Could not retrieve database endpoint"
    exit 1
fi

echo "✅ Database endpoint: $DB_ENDPOINT"
echo "✅ Database port: $DB_PORT"

# Save connection information
echo ""
echo "💾 Saving connection information..."
cat > usndc-connection-info.txt << EOF
# USNDC Database Connection Information
# Generated: $(date)

DB_HOST="$DB_ENDPOINT"
DB_PORT="$DB_PORT"
DB_NAME="usndc_schema"
DB_USER="$DB_USERNAME"
DB_PASSWORD="$DB_PASSWORD"

# Connection String
CONNECTION_STRING="postgresql://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/usndc_schema"

# psql command
# psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "usndc_schema"
EOF

echo "✅ Connection info saved to usndc-connection-info.txt"

# Wait for database to be available
echo ""
echo "⏳ Waiting for database to be available..."
echo "   This may take several minutes..."

# Check if psql is available
if command -v psql &> /dev/null; then
    export PGPASSWORD="$DB_PASSWORD"
    
    # Wait up to 10 minutes for database
    COUNTER=0
    MAX_ATTEMPTS=60
    
    while [ $COUNTER -lt $MAX_ATTEMPTS ]; do
        if psql -h "$DB_ENDPOINT" -p "$DB_PORT" -U "$DB_USERNAME" -d "usndc_schema" -c "SELECT version();" > /dev/null 2>&1; then
            echo "✅ Database is ready!"
            break
        else
            echo "   Attempt $((COUNTER + 1))/$MAX_ATTEMPTS - Database not ready yet..."
            sleep 10
            COUNTER=$((COUNTER + 1))
        fi
    done
    
    if [ $COUNTER -eq $MAX_ATTEMPTS ]; then
        echo "⚠️  Database readiness check timed out"
        echo "   The database may still be initializing"
        echo "   You can check status in AWS Console or try connecting manually"
    fi
else
    echo "⚠️  psql not found - skipping connection test"
    echo "   Database should be ready in a few minutes"
fi

echo ""
echo "🎉 USNDC Database Infrastructure Deployment Complete!"
echo "=================================================="
echo ""
echo "📋 Next Steps:"
echo "   1. Run: ./setup-usndc-schema.sh to populate the database schema"
echo "   2. Run: ./generate-usndc-docs.sh to generate documentation"
echo ""
echo "🔗 Connection Details:"
echo "   Host: $DB_ENDPOINT"
echo "   Port: $DB_PORT"
echo "   Database: usndc_schema"
echo "   Username: $DB_USERNAME"
echo ""
echo "💡 Connect manually:"
echo "   psql -h $DB_ENDPOINT -p $DB_PORT -U $DB_USERNAME -d usndc_schema"