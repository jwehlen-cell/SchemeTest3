#!/bin/bash

# Complete AWS Free Tier Database Schema Browser Setup
# Automates the entire process from database creation to live documentation

set -e  # Exit on any error

echo "🚀 NDC Schema Browser - Complete AWS Setup"
echo "=========================================="
echo "This script will:"
echo "1. 🏗️  Deploy PostgreSQL databases on AWS Free Tier"
echo "2. 🔄 Convert Oracle schemas to PostgreSQL"
echo "3. 📥 Import schemas into RDS databases"
echo "4. 📊 Generate live SchemaSpy documentation"
echo "5. 🌐 Deploy enhanced website with live database features"
echo ""

# Check prerequisites
echo "🔍 Checking prerequisites..."

if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI is not installed. Please install it first:"
    echo "   https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
    exit 1
fi

if ! aws sts get-caller-identity &> /dev/null; then
    echo "❌ AWS CLI is not configured. Please run 'aws configure' first."
    exit 1
fi

if ! command -v psql &> /dev/null; then
    echo "❌ PostgreSQL client (psql) is not installed."
    echo "📦 Install it with:"
    echo "   macOS: brew install postgresql"
    echo "   Ubuntu: sudo apt-get install postgresql-client"
    exit 1
fi

if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. SchemaSpy requires Java 8 or higher."
    echo "📦 Install Java:"
    echo "   macOS: brew install openjdk"
    echo "   Ubuntu: sudo apt-get install openjdk-11-jdk"
    exit 1
fi

echo "✅ All prerequisites met"

# Confirmation prompt
echo ""
echo "⚠️  WARNING: This will create AWS resources that may incur charges."
echo "💰 Estimated cost: \$0/month (Free Tier for 12 months)"
echo "🕐 Setup time: ~20-30 minutes"
echo ""
read -p "Do you want to proceed? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Setup cancelled"
    exit 1
fi

echo ""
echo "🏗️  Step 1: Deploying AWS RDS Databases..."
echo "=========================================="
if ./aws/deploy-databases.sh; then
    echo "✅ Database deployment initiated"
else
    echo "❌ Database deployment failed"
    exit 1
fi

echo ""
echo "⏳ Waiting for databases to become available (this may take 10-15 minutes)..."
echo "💡 You can monitor progress in the AWS Console: https://console.aws.amazon.com/rds/"

# Wait for database availability before proceeding
ENV_FILE="aws/database-connections.env"
if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
    
    # Wait function
    wait_for_db() {
        local connection_string=$1
        local db_name=$2
        local max_attempts=60  # 30 minutes
        local attempt=1
        
        while [ $attempt -le $max_attempts ]; do
            if psql "$connection_string" -c "SELECT 1;" >/dev/null 2>&1; then
                echo "✅ $db_name database is available"
                return 0
            fi
            
            echo "   Waiting for $db_name... (attempt $attempt/$max_attempts)"
            sleep 30
            ((attempt++))
        done
        
        echo "❌ $db_name database not available after 30 minutes"
        return 1
    }
    
    # Wait for both databases
    if wait_for_db "$LEGACY_CONNECTION_STRING" "Legacy" && wait_for_db "$NDCPLUS_CONNECTION_STRING" "NDC PLUS"; then
        echo "✅ Both databases are available"
    else
        echo "❌ Databases did not become available. Please check AWS Console."
        exit 1
    fi
else
    echo "❌ Database connection file not found. Deployment may have failed."
    exit 1
fi

echo ""
echo "📝 Step 2: Setting up Database Schemas..."
echo "======================================="
if ./aws/setup-schemas.sh; then
    echo "✅ Schemas imported successfully"
else
    echo "❌ Schema import failed"
    exit 1
fi

echo ""
echo "📊 Step 3: Generating Live Documentation..."
echo "=========================================="
if ./aws/generate-live-docs.sh; then
    echo "✅ Live documentation generated"
else
    echo "❌ Live documentation generation failed"
    exit 1
fi

echo ""
echo "🌐 Step 4: Deploying Live Database Website..."
echo "=============================================="
if ./deploy-live/deploy.sh; then
    echo "✅ Live database website deployed successfully"
else
    echo "❌ Live website deployment failed"
    exit 1
fi

echo ""
echo "🎉 SETUP COMPLETE!"
echo "=================="
echo ""
echo "✅ Your NDC Schema Browser is now live with:"
echo "   📊 Static table browser (52 tables)"
echo "   📈 Entity relationship diagrams (3 visual schemas)"
echo "   🔴 Live database documentation (SchemaSpy integration)"
echo "   ☁️  AWS Free Tier PostgreSQL databases"
echo ""
echo "🌐 Access your schema browsers:"
echo "   📚 Static Version: http://ndc-schematest3-clone.s3-website-us-east-1.amazonaws.com"
echo "   🔴 Live Version: http://ndc-schema3-live.s3-website-us-east-1.amazonaws.com"
echo ""
echo "📊 Database Information:"
echo "   Legacy Tables: 17 tables imported"
echo "   NDC PLUS Tables: 35 tables imported"
echo "   Total Documentation: 52 tables with live analysis"
echo ""
echo "💰 Cost Information:"
echo "   Current: \$0/month (AWS Free Tier)"
echo "   After 12 months: ~\$25/month for both databases"
echo ""
echo "🔧 Management Commands:"
echo "   View local docs: ./aws/view-docs.sh"
echo "   Regenerate docs: ./aws/generate-live-docs.sh"
echo "   Redeploy static: ./deploy/deploy.sh"
echo "   Redeploy live: ./deploy-live/deploy.sh"
echo "   Database connections: source aws/database-connections.env"
echo ""
echo "📚 Documentation locations:"
echo "   📚 Static browser: http://ndc-schematest3-clone.s3-website-us-east-1.amazonaws.com"
echo "   🔴 Live browser: http://ndc-schema3-live.s3-website-us-east-1.amazonaws.com"
echo "   🏛️ Legacy live docs: http://ndc-schema3-live.s3-website-us-east-1.amazonaws.com/live-docs/legacy/"
echo "   🗄️ NDC PLUS live docs: http://ndc-schema3-live.s3-website-us-east-1.amazonaws.com/live-docs/ndc-plus/"
echo ""
echo "🎯 You now have TWO schema browsers:"
echo "   📚 STATIC VERSION: Fast, reliable documentation for sharing"
echo "   🔴 LIVE VERSION: Real-time database analysis with AWS RDS"
echo "   Choose the right tool for each use case!"