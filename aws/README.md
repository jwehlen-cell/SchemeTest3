# AWS Free Tier Database Integration

This directory contains all the tools and scripts needed to deploy your NDC Schema Browser with live PostgreSQL databases on AWS Free Tier.

## 🚀 Quick Start

**One-command setup** (recommended):
```bash
./aws/setup-complete.sh
```

This automated script will:
1. Deploy PostgreSQL databases on AWS Free Tier
2. Convert Oracle schemas to PostgreSQL format
3. Import all 52 tables into RDS instances
4. Generate live SchemaSpy documentation
5. Deploy enhanced website with live database features

## 📁 Files Overview

### 🏗️ Infrastructure
- `rds-databases.yaml` - CloudFormation template for PostgreSQL RDS instances
- `deploy-databases.sh` - Creates AWS databases and saves connection details
- `database-connections.env` - Generated connection strings and credentials

### 🔄 Schema Conversion
- `convert_schemas.py` - Converts Oracle DDL to PostgreSQL format
- `legacy_schema.sql` - Generated PostgreSQL DDL for Legacy schema (17 tables)
- `ndc_plus_schema.sql` - Generated PostgreSQL DDL for NDC PLUS schema (35 tables)

### 📊 Live Documentation
- `setup-schemas.sh` - Imports schemas into RDS databases
- `generate-live-docs.sh` - Creates SchemaSpy documentation from live databases
- `schemaspy-output/` - Generated interactive HTML documentation
- `view-docs.sh` - Quick access to local documentation

### 🌐 Deployment
- `setup-complete.sh` - Master script that runs the entire setup process

## 💰 Cost Information

### AWS Free Tier (First 12 Months)
- **RDS PostgreSQL**: 750 hours/month per instance = 1,500 hours total
- **Storage**: 20GB per database = 40GB total (Free Tier: 20GB)
- **Estimated Cost**: **$0/month**

### After Free Tier
- **db.t3.micro instances**: ~$12.50/month each = $25/month total
- **Storage (40GB)**: ~$5/month
- **Total**: ~$30/month

## 🔧 Manual Setup Steps

If you prefer to run each step manually:

### 1. Deploy Databases
```bash
./aws/deploy-databases.sh
```

### 2. Import Schemas
```bash
./aws/setup-schemas.sh
```

### 3. Generate Live Documentation
```bash
./aws/generate-live-docs.sh
```

### 4. Deploy Enhanced Website
```bash
./deploy/deploy.sh
```

## 📊 What You Get

### Live Database Features
- **Interactive ER Diagrams**: Generated from actual database structure
- **Real-time Analysis**: Live constraint validation and relationship detection
- **Orphan Table Detection**: Automatically identifies unconnected tables
- **Performance Insights**: Database statistics and optimization suggestions

### Enhanced Website
- **Three-tab Interface**: Static browser, visual diagrams, live documentation
- **Hybrid Approach**: Best of both static and live documentation
- **Global Access**: Deployed on AWS S3 for worldwide availability

## 🔍 Monitoring and Management

### Check Database Status
```bash
# Load connection details
source aws/database-connections.env

# Connect to databases
psql "$LEGACY_CONNECTION_STRING"
psql "$NDCPLUS_CONNECTION_STRING"
```

### Regenerate Documentation
```bash
# After schema changes
./aws/generate-live-docs.sh
./deploy/deploy.sh
```

### View Documentation Locally
```bash
./aws/view-docs.sh
```

## 🛠️ Troubleshooting

### Database Connection Issues
```bash
# Check RDS instance status
aws rds describe-db-instances --region us-east-1

# Test connectivity
psql "$LEGACY_CONNECTION_STRING" -c "SELECT version();"
```

### SchemaSpy Issues
```bash
# Verify Java installation
java -version

# Check PostgreSQL driver
ls -la aws/postgresql-*.jar
```

### Website Deployment Issues
```bash
# Check S3 bucket
aws s3 ls s3://ndc-schematest/ --recursive

# Verify live docs directory
ls -la deploy/live-docs/
```

## 🔐 Security Notes

- RDS instances are configured with **public access** for development
- Default security group allows PostgreSQL access from anywhere (0.0.0.0/0)
- For production use, restrict access to specific IP ranges
- Database credentials are stored in `database-connections.env` (add to .gitignore for production)

## 🗑️ Cleanup

To remove all AWS resources:
```bash
# Delete CloudFormation stack
aws cloudformation delete-stack --stack-name ndc-schema-databases --region us-east-1

# This will remove:
# - Both RDS instances
# - Security groups
# - All associated resources
```

## 📈 Next Steps

After setup, you can:
1. **Customize schemas** by editing the SQL files and re-importing
2. **Add sample data** to see SchemaSpy's data analysis features
3. **Configure monitoring** with CloudWatch for database performance
4. **Set up backups** for production use
5. **Implement CI/CD** to automatically update documentation when schemas change

---

**Need help?** Check the main project documentation or open an issue in the repository.