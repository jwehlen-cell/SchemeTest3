#!/bin/bash

# Clone Repository Deployment Safety Checker
# Prevents accidental deployment to original repository resources

set -e

echo "🛡️  CLONE REPOSITORY SAFETY CHECK"
echo "================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SAFETY_PASSED=true

# Check AWS CLI
echo "🔍 Checking AWS CLI configuration..."
if ! command -v aws &> /dev/null; then
    echo -e "${RED}❌ AWS CLI is not installed${NC}"
    exit 1
fi

if ! aws sts get-caller-identity &> /dev/null; then
    echo -e "${RED}❌ AWS CLI is not configured${NC}"
    exit 1
fi

# Show current AWS account
AWS_ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
AWS_USER=$(aws sts get-caller-identity --query Arn --output text)
echo -e "${BLUE}📋 Current AWS Account: ${AWS_ACCOUNT}${NC}"
echo -e "${BLUE}👤 Current User/Role: ${AWS_USER}${NC}"
echo ""

# Check for original resource names in deployment scripts
echo "🔍 Scanning for original resource references..."

ORIGINAL_RESOURCES=(
    "\bndc-schematest\b"
    "\bndc-schema-databases\b" 
    "\bndc-schema-rds\b"
    "\bndc-schema-live-db\b"
)

CLONE_RESOURCES=(
    "ndc-schematest3-clone"
    "ndc-schema3-databases"
    "ndc-schema3-rds" 
    "ndc-schema3-live-db"
)

# Files to check
DEPLOYMENT_FILES=(
    "deploy/deploy.sh"
    "aws/deploy-databases.sh"
    "aws/deploy-rds.sh"
    "aws/complete-rds-deployment.sh"
    "aws/setup-complete.sh"
    "aws/generate-live-docs.sh"
    "aws/generate-live-docs-rds.sh"
    "aws/generate-live-docs-local.sh"
)

echo "📁 Checking deployment files for original resource names..."
for file in "${DEPLOYMENT_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        for resource in "${ORIGINAL_RESOURCES[@]}"; do
            if grep -qE "$resource" "$file" 2>/dev/null; then
                echo -e "${RED}⚠️  DANGER: Found '$resource' in $file${NC}"
                SAFETY_PASSED=false
            fi
        done
        echo -e "${GREEN}✅ $file - Safe${NC}"
    else
        echo -e "${YELLOW}⚠️  $file - File not found${NC}"
    fi
done

echo ""

# Check for clone resource names (should be present)
echo "🔍 Verifying clone resource names are in use..."
CLONE_FOUND=false
for file in "${DEPLOYMENT_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        for resource in "${CLONE_RESOURCES[@]}"; do
            if grep -q "$resource" "$file" 2>/dev/null; then
                CLONE_FOUND=true
                break
            fi
        done
    fi
done

if [ "$CLONE_FOUND" = true ]; then
    echo -e "${GREEN}✅ Clone resource names found in deployment scripts${NC}"
else
    echo -e "${RED}❌ No clone resource names found - scripts may not be updated${NC}"
    SAFETY_PASSED=false
fi

echo ""

# Check current S3 buckets for conflicts
echo "🪣 Checking existing S3 buckets for conflicts..."
for resource in "${ORIGINAL_RESOURCES[@]}"; do
    if aws s3 ls s3://"$resource" >/dev/null 2>&1; then
        echo -e "${RED}⚠️  DANGER: Original bucket 's3://$resource' exists and is accessible${NC}"
        echo -e "${RED}   This means you could accidentally deploy to the original!${NC}"
        SAFETY_PASSED=false
    fi
done

# Check CloudFormation stacks
echo ""
echo "📚 Checking CloudFormation stacks..."
if aws cloudformation describe-stacks --stack-name "ndc-schema-databases" >/dev/null 2>&1; then
    echo -e "${YELLOW}ℹ️  INFO: Original CloudFormation stack 'ndc-schema-databases' exists${NC}"
    echo -e "${YELLOW}   This is expected - you're using clone stack name 'ndc-schema3-databases'${NC}"
else
    echo -e "${GREEN}✅ Original CloudFormation stack not found${NC}"
fi

# Check if clone stack exists (that's OK)
if aws cloudformation describe-stacks --stack-name "ndc-schema3-databases" >/dev/null 2>&1; then
    echo -e "${GREEN}✅ Clone CloudFormation stack 'ndc-schema3-databases' exists${NC}"
else
    echo -e "${BLUE}ℹ️  Clone CloudFormation stack 'ndc-schema3-databases' not found (will be created)${NC}"
fi

# Final safety assessment
echo ""
echo "📊 SAFETY ASSESSMENT"
echo "===================="

if [ "$SAFETY_PASSED" = true ]; then
    echo -e "${GREEN}✅ SAFE TO DEPLOY${NC}"
    echo -e "${GREEN}   All checks passed - no conflicts with original repository${NC}"
    echo ""
    echo -e "${BLUE}🚀 You can proceed with deployment using:${NC}"
    echo -e "${BLUE}   ./deploy/deploy.sh${NC}"
    echo -e "${BLUE}   ./aws/complete-rds-deployment.sh${NC}"
    exit 0
else
    echo -e "${RED}❌ NOT SAFE TO DEPLOY${NC}"
    echo -e "${RED}   ⚠️  RISK OF AFFECTING ORIGINAL REPOSITORY${NC}"
    echo ""
    echo -e "${YELLOW}📝 TODO: Fix the issues above before deploying${NC}"
    echo -e "${YELLOW}   1. Update any remaining original resource references${NC}"
    echo -e "${YELLOW}   2. Ensure clone resource names are in all deployment scripts${NC}"
    echo -e "${YELLOW}   3. Run this safety check again${NC}"
    exit 1
fi