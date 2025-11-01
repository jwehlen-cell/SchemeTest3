# NDC Schema Browser - Dual Version Documentation

This repository now provides **TWO SEPARATE** schema browsers, each optimized for different use cases:

## 🌐 **Two Versions Available**

### 📚 **Static Version** (Original)
**URL**: http://ndc-schematest.s3-website-us-east-1.amazonaws.com
- ✅ **Fast loading** - No database dependencies
- ✅ **Always available** - Works offline after initial load
- ✅ **Perfect for sharing** - Send links to anyone, anytime
- ✅ **Version controlled** - Documented in Git history
- ✅ **Comprehensive** - All 52 tables with detailed specifications

### 🔴 **Live Database Version** (New)
**URL**: http://ndc-schema-live-db.s3-website-us-east-1.amazonaws.com
- ✅ **Real-time analysis** - Connected to live PostgreSQL databases
- ✅ **Interactive documentation** - SchemaSpy-powered exploration
- ✅ **Constraint validation** - Live database integrity checking
- ✅ **Performance insights** - Database statistics and optimization
- ✅ **Orphan detection** - Automatic relationship analysis

## 🎯 **When to Use Each Version**

### Use **Static Version** for:
- 📋 **Documentation sharing** with teams or stakeholders
- 🚀 **Quick reference** when you need fast access
- 📚 **Training materials** or presentations
- 🌍 **Public sharing** without database access concerns
- 📖 **Offline work** or unreliable network conditions

### Use **Live Version** for:
- 🔍 **Database analysis** and schema validation
- 🛠️ **Development work** requiring real-time insights
- 📊 **Performance monitoring** and optimization
- 🔧 **Schema maintenance** and relationship verification
- 🧪 **Testing environments** with live database validation

## 🚀 **Deployment Guide**

### Quick Start - Static Version Only
```bash
# Already deployed and ready to use!
open http://ndc-schematest.s3-website-us-east-1.amazonaws.com
```

### Quick Start - Live Database Version
```bash
# Complete setup with AWS Free Tier databases
./aws/setup-complete.sh
```

### Manual Setup - Live Version Only
```bash
# 1. Deploy live website (placeholder)
./deploy-live/deploy.sh

# 2. Deploy RDS databases (15 minutes)
./aws/deploy-databases.sh

# 3. Import schemas (5 minutes)
./aws/setup-schemas.sh

# 4. Generate live documentation (10 minutes)
./aws/generate-live-docs.sh

# 5. Redeploy with live docs (2 minutes)
./deploy-live/deploy.sh
```

## 📁 **Repository Structure**

### Static Version Files
- `deploy/` - Static version deployment folder
- `images/` - PNG diagrams for static documentation
- `Legacy_schema.mmd` - Mermaid source for Legacy ER diagram
- `NDC_PLUS_schema.mmd` - Mermaid source for NDC PLUS ER diagram
- `Cross_Schema_Mapping.mmd` - Cross-schema relationships

### Live Database Version Files
- `deploy-live/` - Live version deployment folder
- `aws/` - AWS infrastructure and database setup
- `aws/rds-databases.yaml` - CloudFormation template
- `aws/legacy_schema.sql` - PostgreSQL DDL for Legacy schema
- `aws/ndc_plus_schema.sql` - PostgreSQL DDL for NDC PLUS schema

## 💰 **Cost Information**

### Static Version
- **Cost**: $0 forever (AWS S3 static hosting)
- **Storage**: Minimal (a few MB)

### Live Database Version
- **AWS Free Tier** (First 12 months): $0/month
  - 2 × db.t3.micro RDS instances (750 hours each)
  - 40GB total storage (within free tier limits)
- **After Free Tier**: ~$30/month
  - Database instances: ~$25/month
  - Storage: ~$5/month

## 🔧 **Management Commands**

### Static Version
```bash
# Redeploy static version
./deploy/deploy.sh

# Regenerate PNG diagrams
./generate_images.sh

# Update documentation
python tools/parse_schema.py
```

### Live Database Version
```bash
# Redeploy live website
./deploy-live/deploy.sh

# Regenerate live documentation
./aws/generate-live-docs.sh

# Check database status
source aws/database-connections.env
psql "$LEGACY_CONNECTION_STRING"

# View local SchemaSpy docs
./aws/view-docs.sh
```

## 📊 **Feature Comparison**

| Feature | Static Version | Live Version |
|---------|---------------|--------------|
| **Loading Speed** | ⚡ Instant | 🐌 Database dependent |
| **Availability** | 🌍 Always online | 🔗 Requires DB connection |
| **Cost** | 💚 Free forever | 💰 $0-30/month |
| **Documentation Depth** | 📚 Comprehensive | 🔍 Real-time analysis |
| **Relationship Analysis** | 📈 Visual diagrams | 🔗 Interactive explorer |
| **Database Validation** | ❌ Not available | ✅ Live constraint checking |
| **Performance Insights** | ❌ Not available | ✅ Database statistics |
| **Sharing** | ✅ Easy link sharing | ⚠️ Requires access setup |

## 🛠️ **Troubleshooting**

### Static Version Issues
- **Diagrams not loading**: Check `images/` folder and S3 upload
- **Table data missing**: Verify `schema_data.json` is embedded
- **Deployment fails**: Check AWS CLI configuration

### Live Version Issues
- **Database connection fails**: Verify RDS instances are running
- **SchemaSpy errors**: Check Java installation and PostgreSQL driver
- **Website not loading**: Verify S3 bucket public access settings

### Common Solutions
```bash
# Check AWS configuration
aws sts get-caller-identity

# Verify file structure
ls -la deploy/ deploy-live/ aws/

# Test database connectivity
source aws/database-connections.env
psql "$LEGACY_CONNECTION_STRING" -c "SELECT version();"
```

## 🔍 **Monitoring**

### Static Version
- Monitor via S3 console: Access logs and storage metrics
- Check CDN performance if using CloudFront

### Live Version
- Database monitoring: AWS RDS console performance insights
- Website monitoring: S3 access logs and CloudWatch metrics
- Cost monitoring: AWS Cost Explorer for RDS usage

## 🚀 **Advanced Usage**

### Custom Schema Updates
1. **Static Version**: Edit text files → regenerate → redeploy
2. **Live Version**: Update database → regenerate docs → redeploy

### Integration with CI/CD
```bash
# Automated static deployment
git push → GitHub Actions → ./deploy/deploy.sh

# Automated live documentation
Schema change → ./aws/generate-live-docs.sh → ./deploy-live/deploy.sh
```

### Backup and Recovery
- **Static**: Version controlled in Git
- **Live**: RDS automated backups + S3 cross-region replication

## 📞 **Support**

- **Issues**: Open GitHub issues for problems or feature requests
- **Documentation**: Check individual README files in `/aws/` and `/deploy*/`
- **Community**: Share your schema browser implementations!

---

**Choose the right tool for your needs: Static for speed and sharing, Live for analysis and insights!**