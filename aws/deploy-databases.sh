#!/bin/bash

# AWS RDS Database Deployment Script for NDC Schema Browser
# Creates PostgreSQL databases on AWS Free Tier

set -e  # Exit on any error

# Configuration
STACK_NAME="ndc-schema-databases"
TEMPLATE_FILE="aws/rds-databases.yaml"
REGION="us-east-1"
DB_USERNAME="schemaadmin"
DB_PASSWORD="SchemaTest2024!"

echo "🚀 AWS RDS Database Deployment"
echo "==============================="
echo "Stack Name: $STACK_NAME"
echo "Region: $REGION"
echo "Template: $TEMPLATE_FILE"
echo ""

# Check if AWS CLI is installed and configured
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI is not installed. Please install it first:"
    echo "   https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
    exit 1
fi

if ! aws sts get-caller-identity &> /dev/null; then
    echo "❌ AWS CLI is not configured. Please run 'aws configure' first."
    exit 1
fi

echo "✅ AWS CLI is configured"

# Check if CloudFormation template exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "❌ CloudFormation template not found: $TEMPLATE_FILE"
    exit 1
fi

echo "✅ CloudFormation template found"

# Deploy the stack
echo ""
echo "📦 Deploying CloudFormation stack..."
echo "⏱️  This will take 10-15 minutes for RDS instances to be created..."

aws cloudformation deploy \
    --template-file "$TEMPLATE_FILE" \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --parameter-overrides \
        DatabaseUsername="$DB_USERNAME" \
        DatabasePassword="$DB_PASSWORD" \
    --capabilities CAPABILITY_IAM \
    --no-fail-on-empty-changeset

if [ $? -eq 0 ]; then
    echo "✅ CloudFormation stack deployed successfully!"
else
    echo "❌ CloudFormation deployment failed"
    exit 1
fi

# Get stack outputs
echo ""
echo "📋 Database Connection Information:"
echo "=================================="

LEGACY_ENDPOINT=$(aws cloudformation describe-stacks \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --query 'Stacks[0].Outputs[?OutputKey==`LegacyDatabaseEndpoint`].OutputValue' \
    --output text)

NDCPLUS_ENDPOINT=$(aws cloudformation describe-stacks \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --query 'Stacks[0].Outputs[?OutputKey==`NDCPlusDatabaseEndpoint`].OutputValue' \
    --output text)

echo "🏛️  Legacy Database:"
echo "   Endpoint: $LEGACY_ENDPOINT"
echo "   Database: legacy_schema"
echo "   Username: $DB_USERNAME"
echo "   Password: $DB_PASSWORD"
echo "   Connection: postgresql://$DB_USERNAME:$DB_PASSWORD@$LEGACY_ENDPOINT:5432/legacy_schema"
echo ""

echo "🗄️  NDC PLUS Database:"
echo "   Endpoint: $NDCPLUS_ENDPOINT"
echo "   Database: ndc_plus_schema" 
echo "   Username: $DB_USERNAME"
echo "   Password: $DB_PASSWORD"
echo "   Connection: postgresql://$DB_USERNAME:$NDCPLUS_ENDPOINT:5432/ndc_plus_schema"
echo ""

# Save connection details to file
cat > aws/database-connections.env << EOF
# Database connection details for NDC Schema Browser
# Generated on $(date)

LEGACY_DB_ENDPOINT=$LEGACY_ENDPOINT
LEGACY_DB_NAME=legacy_schema
LEGACY_DB_USERNAME=$DB_USERNAME
LEGACY_DB_PASSWORD=$DB_PASSWORD
LEGACY_CONNECTION_STRING=postgresql://$DB_USERNAME:$DB_PASSWORD@$LEGACY_ENDPOINT:5432/legacy_schema

NDCPLUS_DB_ENDPOINT=$NDCPLUS_ENDPOINT
NDCPLUS_DB_NAME=ndc_plus_schema
NDCPLUS_DB_USERNAME=$DB_USERNAME
NDCPLUS_DB_PASSWORD=$DB_PASSWORD
NDCPLUS_CONNECTION_STRING=postgresql://$DB_USERNAME:$DB_PASSWORD@$NDCPLUS_ENDPOINT:5432/ndc_plus_schema

# AWS Details
AWS_REGION=$REGION
CLOUDFORMATION_STACK=$STACK_NAME
EOF

echo "💾 Connection details saved to: aws/database-connections.env"
echo ""

echo "💰 Cost Information:"
echo "==================="
echo "• Instance Type: db.t3.micro (Free Tier eligible)"
echo "• Storage: 20GB per database (Free Tier eligible)"  
echo "• Estimated Cost: \$0/month for first 12 months (Free Tier)"
echo "• After Free Tier: ~\$25/month for both databases"
echo ""

echo "⏭️  Next Steps:"
echo "==============="
echo "1. Wait for databases to become available (~10-15 minutes)"
echo "2. Run './aws/setup-schemas.sh' to create tables"
echo "3. Run './aws/deploy-schemaspy.sh' to generate live documentation"
echo ""

echo "🎉 Database deployment initiated successfully!"
echo "Check AWS Console to monitor progress: https://console.aws.amazon.com/rds/"