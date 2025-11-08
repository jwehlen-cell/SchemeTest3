#!/bin/bash

# Deploy Oracle SchemaSpy docs and landing page to a specific S3 website bucket
# Default target is the bucket provided by the user request.

set -euo pipefail

BUCKET_NAME=${BUCKET_NAME:-"usndc-enhanced-schemaspy-1762554476"}
REGION=${REGION:-"us-east-1"}
DEPLOY_DIR=${DEPLOY_DIR:-"deploy-live"}

echo "🚀 Deploying Oracle SchemaSpy site"
echo "Bucket: $BUCKET_NAME"
echo "Region: $REGION"
echo "Source: $DEPLOY_DIR/"

if ! command -v aws >/dev/null 2>&1; then
  echo "❌ AWS CLI not found. Install and configure it first."; exit 1
fi
if ! aws sts get-caller-identity >/dev/null 2>&1; then
  echo "❌ AWS CLI not configured. Run 'aws configure'."; exit 1
fi

# Ensure required content exists
if [ ! -d "$DEPLOY_DIR" ]; then
  echo "❌ Missing $DEPLOY_DIR directory"; exit 1
fi
if [ ! -d "$DEPLOY_DIR/docs/oracle" ]; then
  echo "⚠️  Oracle docs not found at $DEPLOY_DIR/docs/oracle. Generating now..."
  if [ -f "aws/generate-oracle-docs.sh" ]; then
    bash aws/generate-oracle-docs.sh
  else
    echo "❌ Generator script not found: aws/generate-oracle-docs.sh"; exit 1
  fi
fi

# Try to configure website hosting if not already present (idempotent)
set +e
aws s3api put-bucket-website \
  --bucket "$BUCKET_NAME" \
  --website-configuration '{"IndexDocument":{"Suffix":"index.html"},"ErrorDocument":{"Key":"error.html"}}' 2>/dev/null
set -e

# Public read policy (idempotent best-effort)
POLICY_TMP=$(mktemp)
cat > "$POLICY_TMP" <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {"Sid":"PublicReadGetObject","Effect":"Allow","Principal":"*","Action":"s3:GetObject","Resource":"arn:aws:s3:::$BUCKET_NAME/*"}
  ]
}
EOF
set +e
aws s3api put-bucket-policy --bucket "$BUCKET_NAME" --policy file://"$POLICY_TMP" 2>/dev/null
set -e
rm -f "$POLICY_TMP"

# Upload site (preserve content types for html)
aws s3 cp "$DEPLOY_DIR/index.html" "s3://$BUCKET_NAME/index.html" --content-type "text/html" --cache-control "max-age=300"
aws s3 cp "$DEPLOY_DIR/error.html" "s3://$BUCKET_NAME/error.html" --content-type "text/html" --cache-control "max-age=300" 2>/dev/null || true
aws s3 cp "$DEPLOY_DIR/docs/" "s3://$BUCKET_NAME/docs/" --recursive --cache-control "max-age=3600"

WEBSITE_URL="http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

cat > "$DEPLOY_DIR/deployment-info.env" <<EOF
# Oracle SchemaSpy Site Deployment
DEPLOYED_AT=$(date)
BUCKET_NAME=$BUCKET_NAME
REGION=$REGION
WEBSITE_URL=$WEBSITE_URL
EOF

echo "✅ Deployed to: $WEBSITE_URL"
