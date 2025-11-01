#!/bin/bash

echo "🚀 NDC Schema Browser - Complete AWS RDS Deployment"
echo "================================================="

# Step 1: Populate RDS databases
echo "📊 Step 1: Populating RDS databases..."
./aws/populate-rds-schemas.sh

if [ $? -ne 0 ]; then
    echo "❌ Database population failed!"
    exit 1
fi

# Step 2: Generate live documentation
echo "📚 Step 2: Generating live documentation from RDS..."
./aws/generate-live-docs-rds.sh

if [ $? -ne 0 ]; then
    echo "❌ Documentation generation failed!"
    exit 1
fi

# Step 3: Deploy to S3
echo "🌐 Step 3: Deploying to S3..."
aws s3 sync deploy-rds/ s3://ndc-schema-rds --delete

if [ $? -ne 0 ]; then
    echo "❌ S3 deployment failed!"
    exit 1
fi

# Get final endpoints
echo ""
echo "🎉 AWS RDS Deployment Completed Successfully!"
echo "==========================================="

# Load connection info
source aws/rds-connection-info.txt

echo ""
echo "📊 Database Information:"
echo "   🏛️  Legacy Schema: $LEGACY_DB_HOST (PostgreSQL)"
echo "   🚀 NDC PLUS Schema: $NDC_PLUS_DB_HOST (PostgreSQL)"
echo ""
echo "🌐 Live Documentation URLs:"
echo "   📱 Main Site: http://ndc-schema-rds.s3-website-us-east-1.amazonaws.com"
echo "   🏛️  Legacy: http://ndc-schema-rds.s3-website-us-east-1.amazonaws.com/docs/legacy/"
echo "   🚀 NDC PLUS: http://ndc-schema-rds.s3-website-us-east-1.amazonaws.com/docs/ndc_plus/"
echo ""
echo "✨ Features Available:"
echo "   • Live relationship diagrams from AWS RDS PostgreSQL"
echo "   • Real-time schema analysis and statistics"
echo "   • Interactive table exploration with foreign keys"
echo "   • Cross-schema relationship mapping"
echo "   • Professional ER diagrams with Graphviz"
echo ""
echo "💰 Cost: AWS Free Tier eligible (2 x db.t3.micro RDS instances)"
echo ""

# Save deployment info
cat > DEPLOYMENT_INFO.md << EOF
# NDC Schema Browser - AWS RDS Deployment

## 🎯 Deployment Status: ✅ ACTIVE

### 🌐 Live Documentation
- **Main Site**: http://ndc-schema-rds.s3-website-us-east-1.amazonaws.com
- **Legacy Schema**: http://ndc-schema-rds.s3-website-us-east-1.amazonaws.com/docs/legacy/
- **NDC PLUS Schema**: http://ndc-schema-rds.s3-website-us-east-1.amazonaws.com/docs/ndc_plus/

### 📊 Database Details
- **Legacy Database**: $LEGACY_DB_HOST
  - Engine: PostgreSQL 15.8
  - Instance: db.t3.micro (Free Tier)
  - Tables: 17 with full relationships
  
- **NDC PLUS Database**: $NDC_PLUS_DB_HOST  
  - Engine: PostgreSQL 15.8
  - Instance: db.t3.micro (Free Tier)
  - Tables: 35 with full relationships

### 🔧 Infrastructure
- **CloudFormation Stack**: ndc-schema-databases
- **VPC**: Custom VPC with public subnets
- **Security**: PostgreSQL access (port 5432) from anywhere
- **S3 Bucket**: ndc-schema-rds (static website hosting)

### 💰 Cost Information
- **Free Tier Eligible**: Yes (both RDS instances)
- **Monthly Cost**: ~\$0 (within free tier limits)
- **Storage**: 20GB per database (40GB total)

### 🛠️ Management Commands
\`\`\`bash
# Regenerate documentation
./aws/generate-live-docs-rds.sh

# Deploy to S3
aws s3 sync deploy-rds/ s3://ndc-schema-rds --delete

# Check database status
aws rds describe-db-instances --db-instance-identifier ndc-legacy-schema
aws rds describe-db-instances --db-instance-identifier ndc-plus-schema

# Delete deployment
aws cloudformation delete-stack --stack-name ndc-schema-databases
aws s3 rm s3://ndc-schema-rds --recursive
aws s3 rb s3://ndc-schema-rds
\`\`\`

Generated: $(date)
EOF

echo "📄 Deployment information saved to DEPLOYMENT_INFO.md"
echo ""
echo "🎉 AWS RDS deployment is now complete and ready for use!"