#!/bin/bash
# Deploy USNDC Schema Documentation to AWS S3 Static Website

echo "🚀 Deploying USNDC Schema Documentation to AWS..."

# Configuration
BUCKET_NAME="usndc-schema-docs-$(date +%s)"
REGION="us-east-1"

# Create S3 bucket for static website hosting
echo "📦 Creating S3 bucket: $BUCKET_NAME"
aws s3 mb s3://$BUCKET_NAME --region $REGION

# Enable static website hosting
echo "🌐 Configuring static website hosting..."
aws s3 website s3://$BUCKET_NAME --index-document schema_browser.html

# Create bucket policy for public read access
echo "🔓 Setting public read permissions..."
cat > bucket-policy.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
        }
    ]
}
EOF

# Apply bucket policy
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://bucket-policy.json

# Upload documentation files
echo "📤 Uploading documentation files..."
aws s3 sync ../docs/ s3://$BUCKET_NAME/ --acl public-read

# Set correct content types
aws s3 cp s3://$BUCKET_NAME/schema_browser.html s3://$BUCKET_NAME/schema_browser.html --metadata-directive REPLACE --content-type "text/html" --acl public-read
aws s3 cp s3://$BUCKET_NAME/usndc_schema_documentation.html s3://$BUCKET_NAME/usndc_schema_documentation.html --metadata-directive REPLACE --content-type "text/html" --acl public-read
aws s3 cp s3://$BUCKET_NAME/schema_metadata.json s3://$BUCKET_NAME/schema_metadata.json --metadata-directive REPLACE --content-type "application/json" --acl public-read

# Get website URL
WEBSITE_URL="http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

echo ""
echo "✅ Deployment Complete!"
echo ""
echo "🌐 Your USNDC Schema Documentation is now live at:"
echo "   Interactive Browser: $WEBSITE_URL"
echo "   Documentation: $WEBSITE_URL/usndc_schema_documentation.html"
echo "   Schema API: $WEBSITE_URL/schema_metadata.json"
echo ""
echo "📊 Features Available:"
echo "   ✅ Interactive table explorer"
echo "   ✅ SQL query builder"
echo "   ✅ Live database connection details"
echo "   ✅ Mobile-responsive design"
echo ""
echo "🔗 Database Connection:"
echo "   Host: usndc-schema-usndc-schematest3-clone.c0320kayk04f.us-east-1.rds.amazonaws.com"
echo "   Port: 5432"
echo "   Database: usndc_schema"
echo ""

# Save deployment info
cat > deployment-info.txt << EOF
USNDC Schema Documentation Deployment
=====================================

Website URL: $WEBSITE_URL
Interactive Browser: $WEBSITE_URL
Documentation: $WEBSITE_URL/usndc_schema_documentation.html
Schema API: $WEBSITE_URL/schema_metadata.json

S3 Bucket: $BUCKET_NAME
Region: $REGION
Deployment Date: $(date)

Database Connection:
Host: usndc-schema-usndc-schematest3-clone.c0320kayk04f.us-east-1.rds.amazonaws.com
Port: 5432
Database: usndc_schema
Username: schemaadmin

Features:
- Interactive table browser
- SQL query builder with samples
- Connection examples
- Mobile responsive
- Live database access
EOF

echo "📝 Deployment details saved to deployment-info.txt"
echo ""
echo "🎉 Your USNDC schema explorer is now live on AWS!"