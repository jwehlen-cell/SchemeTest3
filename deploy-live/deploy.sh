#!/bin/bash

# Live Database Schema Browser Deployment Script
# Deploys the live database version to a separate S3 bucket

set -e  # Exit on any error

# Configuration
BUCKET_NAME="ndc-schema-live-db"
REGION="us-east-1"
DEPLOY_DIR="deploy-live"

echo "🔴 NDC Schema Browser - Live Database Edition Deployment"
echo "========================================================"
echo "Bucket: $BUCKET_NAME"
echo "Region: $REGION"
echo "Deploy Directory: $DEPLOY_DIR"
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

# Check if deployment directory exists
if [ ! -d "$DEPLOY_DIR" ]; then
    echo "❌ Deployment directory not found: $DEPLOY_DIR"
    exit 1
fi

echo "✅ Deployment directory found"

# Step 1: Create S3 bucket for live version
echo ""
echo "📦 Step 1: Creating S3 bucket for live database version..."

if aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$REGION" 2>/dev/null; then
    echo "✅ Bucket '$BUCKET_NAME' created successfully"
else
    if aws s3api head-bucket --bucket "$BUCKET_NAME" 2>/dev/null; then
        echo "⚠️  Bucket '$BUCKET_NAME' already exists"
    else
        echo "❌ Failed to create or access bucket '$BUCKET_NAME'"
        echo "💡 Trying with a unique timestamp suffix..."
        BUCKET_NAME="ndc-schema-live-$(date +%s)"
        aws s3api create-bucket \
            --bucket "$BUCKET_NAME" \
            --region "$REGION"
        echo "✅ Bucket '$BUCKET_NAME' created with unique name"
    fi
fi

# Step 2: Configure bucket for website hosting
echo ""
echo "🌐 Step 2: Configuring bucket for website hosting..."

aws s3api put-bucket-website \
    --bucket "$BUCKET_NAME" \
    --website-configuration '{
        "IndexDocument": {"Suffix": "index.html"},
        "ErrorDocument": {"Key": "error.html"}
    }'

echo "✅ Website hosting configured"

# Step 3: Set bucket policy for public access
echo ""
echo "🔓 Step 3: Setting bucket policy for public access..."

# First, disable block public access
echo "📖 Disabling block public access settings..."
aws s3api put-public-access-block \
    --bucket "$BUCKET_NAME" \
    --public-access-block-configuration \
        "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"

echo "✅ Block public access disabled"

# Wait a moment for the setting to propagate
sleep 5

# Now set the bucket policy
cat > /tmp/live-bucket-policy.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${BUCKET_NAME}/*"
        }
    ]
}
EOF

aws s3api put-bucket-policy \
    --bucket "$BUCKET_NAME" \
    --policy file:///tmp/live-bucket-policy.json

rm /tmp/live-bucket-policy.json
echo "✅ Bucket policy applied"

# Step 4: Copy live documentation if it exists
echo ""
echo "📊 Step 4: Checking for live documentation..."

if [ -d "deploy/live-docs" ]; then
    echo "✅ Live documentation found, copying to deployment folder..."
    cp -r deploy/live-docs "$DEPLOY_DIR/"
    echo "✅ Live documentation copied"
else
    echo "⚠️  No live documentation found. Run './aws/generate-live-docs.sh' first for full functionality."
    
    # Create placeholder live docs
    mkdir -p "$DEPLOY_DIR/live-docs/legacy"
    mkdir -p "$DEPLOY_DIR/live-docs/ndc-plus"
    
    cat > "$DEPLOY_DIR/live-docs/legacy/index.html" << 'EOF'
<!DOCTYPE html>
<html><head><title>Legacy Schema Documentation</title></head>
<body style="font-family: Arial, sans-serif; padding: 40px; text-align: center;">
<h1>🏛️ Legacy Schema Documentation</h1>
<p>Live documentation will appear here after running:</p>
<code>./aws/generate-live-docs.sh</code>
<p style="margin-top: 20px;"><a href="../../index.html">← Back to Live Database Browser</a></p>
</body></html>
EOF
    
    cat > "$DEPLOY_DIR/live-docs/ndc-plus/index.html" << 'EOF'
<!DOCTYPE html>
<html><head><title>NDC PLUS Schema Documentation</title></head>
<body style="font-family: Arial, sans-serif; padding: 40px; text-align: center;">
<h1>🗄️ NDC PLUS Schema Documentation</h1>
<p>Live documentation will appear here after running:</p>
<code>./aws/generate-live-docs.sh</code>
<p style="margin-top: 20px;"><a href="../../index.html">← Back to Live Database Browser</a></p>
</body></html>
EOF
    
    echo "✅ Placeholder documentation created"
fi

# Step 5: Upload files to S3
echo ""
echo "📤 Step 5: Uploading files to S3..."

# Upload main HTML file
aws s3 cp "$DEPLOY_DIR/index.html" "s3://$BUCKET_NAME/index.html" \
    --content-type "text/html" \
    --cache-control "max-age=300"

# Upload live documentation recursively
if [ -d "$DEPLOY_DIR/live-docs" ]; then
    aws s3 cp "$DEPLOY_DIR/live-docs/" "s3://$BUCKET_NAME/live-docs/" \
        --recursive \
        --cache-control "max-age=3600"
fi

echo "✅ Files uploaded successfully"

# Step 6: Get website URL
echo ""
echo "🌍 Step 6: Getting website URL..."
WEBSITE_URL="http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

echo ""
echo "🎉 Live Database Browser Deployment Complete!"
echo "=============================================="
echo ""
echo "🔴 Your live database schema browser is now available at:"
echo "🔗 $WEBSITE_URL"
echo ""
echo "📊 Deployment Summary:"
echo "   • Bucket: $BUCKET_NAME"
echo "   • Region: $REGION"
echo "   • Type: Live Database Edition"
echo "   • Features: Real-time PostgreSQL analysis"
echo ""
echo "🔄 Two Versions Now Available:"
echo "   📚 Static Version: http://ndc-schematest.s3-website-us-east-1.amazonaws.com"
echo "   🔴 Live Version:   $WEBSITE_URL"
echo ""
echo "⏭️  Next Steps:"
echo "==============="
echo "1. 🗄️  Deploy RDS databases: ./aws/deploy-databases.sh"
echo "2. 📊 Generate live docs: ./aws/generate-live-docs.sh"
echo "3. 🔄 Redeploy with live docs: ./deploy-live/deploy.sh"
echo ""
echo "💡 Tips:"
echo "   • Bookmark both URLs for easy access"
echo "   • Use static version for fast reference"
echo "   • Use live version for real-time database analysis"
echo "   • Share the appropriate version based on audience needs"
echo ""
echo "🌐 Open live browser in default browser? (y/n): "
read -r response
if [[ "$response" =~ ^[Yy]$ ]]; then
    if command -v open &> /dev/null; then
        open "$WEBSITE_URL"
    elif command -v xdg-open &> /dev/null; then
        xdg-open "$WEBSITE_URL"
    else
        echo "Please open: $WEBSITE_URL"
    fi
fi

echo ""
echo "✨ Live database browser deployment completed successfully!"

# Save deployment info
cat > deploy-live/deployment-info.env << EOF
# Live Database Browser Deployment Information
# Generated on $(date)

LIVE_BUCKET_NAME=$BUCKET_NAME
LIVE_REGION=$REGION
LIVE_WEBSITE_URL=$WEBSITE_URL
STATIC_WEBSITE_URL=http://ndc-schematest.s3-website-us-east-1.amazonaws.com

# Deployment commands
# Redeploy live version: ./deploy-live/deploy.sh
# Update live docs: ./aws/generate-live-docs.sh && ./deploy-live/deploy.sh
# View static version: open $STATIC_WEBSITE_URL
# View live version: open $WEBSITE_URL
EOF

echo "💾 Deployment info saved to: deploy-live/deployment-info.env"