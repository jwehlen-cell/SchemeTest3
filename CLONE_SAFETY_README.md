# ⚠️ REPOSITORY CLONE SAFETY NOTICE

## 🛡️ This is a Clone Repository

**IMPORTANT:** This repository is a clone/fork and has been modified to prevent accidental interference with the original deployment.

### 🔒 Safety Modifications Made

#### 1. **AWS Resource Names Changed**
- **S3 Buckets**: 
  - Original: `ndc-schematest` → **New: `ndc-schematest3-clone`**
  - Original: `ndc-schema-rds` → **New: `ndc-schema3-rds`** 
  - Original: `ndc-schema-live-db` → **New: `ndc-schema3-live-db`**

- **CloudFormation Stacks**:
  - Original: `ndc-schema-databases` → **New: `ndc-schema3-databases`**

#### 2. **Files Modified for Safety**
- `deploy/deploy.sh` - Updated bucket name
- `aws/deploy-databases.sh` - Updated stack name  
- `aws/deploy-rds.sh` - Updated stack references
- `aws/complete-rds-deployment.sh` - Updated S3 bucket

### 🚦 Before Any AWS Deployment

**ALWAYS run the safety check:**
```bash
./check-deployment-safety.sh
```

This will:
- ✅ Verify you're using clone-safe resource names
- ✅ Check for any remaining references to original resources
- ✅ Confirm AWS CLI is configured for the correct account
- ⚠️ **STOP** deployment if unsafe configurations are detected

### 🔍 Original vs Clone Resources

| Resource Type | Original Name | Clone Name |
|---------------|---------------|------------|
| Main S3 Bucket | `ndc-schematest` | `ndc-schematest3-clone` |
| RDS S3 Bucket | `ndc-schema-rds` | `ndc-schema3-rds` |
| Live DB S3 Bucket | `ndc-schema-live-db` | `ndc-schema3-live-db` |
| CloudFormation Stack | `ndc-schema-databases` | `ndc-schema3-databases` |

### 🌐 Original Deployment URLs (DO NOT MODIFY)
- **Original Main Site**: http://ndc-schematest.s3-website-us-east-1.amazonaws.com
- **Original RDS Site**: http://ndc-schema-rds.s3-website-us-east-1.amazonaws.com  
- **Original Live DB**: http://ndc-schema-live-db.s3-website-us-east-1.amazonaws.com

### 🎯 Your Clone URLs (Safe to Deploy)
- **Clone Main Site**: http://ndc-schematest3-clone.s3-website-us-east-1.amazonaws.com
- **Clone RDS Site**: http://ndc-schema3-rds.s3-website-us-east-1.amazonaws.com
- **Clone Live DB**: http://ndc-schema3-live-db.s3-website-us-east-1.amazonaws.com

### ⚡ Quick Safety Commands

```bash
# Check what AWS account you're using
aws sts get-caller-identity

# List your S3 buckets (should NOT include original names)
aws s3 ls | grep -E "(ndc-schematest|ndc-schema-rds|ndc-schema-live-db)"

# Check CloudFormation stacks (should NOT include 'ndc-schema-databases')
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE | grep "ndc-schema"
```

### 🆘 Emergency: If You Accidentally Deploy to Original

If you accidentally run a deployment script and it targets the original resources:

1. **STOP immediately** with `Ctrl+C`
2. Check AWS Console for any new resources
3. If any resources were created, contact the original repository owner
4. Run the safety check script to verify your configuration

---

**Remember: When in doubt, run `./check-deployment-safety.sh` before ANY deployment!**