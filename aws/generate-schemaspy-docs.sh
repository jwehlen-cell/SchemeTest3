#!/bin/bash

# SchemaSpy Documentation Generator for USNDC Schema
# Generates comprehensive database documentation with relationship diagrams

set -e

echo "🔍 Generating USNDC Schema Documentation with SchemaSpy..."

# Database connection details
DB_HOST="usndc-schema-usndc-schematest3-clone.c0320kayk04f.us-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_NAME="usndc_schema"
DB_USER="schemaadmin"
DB_PASSWORD="SchemaTest2024!"
DB_SCHEMA="public"

# Output directory
OUTPUT_DIR="usndc_schemaspy_docs"

# Clean and create output directory
echo "📁 Preparing output directory..."
rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR

echo "📊 Running SchemaSpy analysis..."
echo "   Database: $DB_HOST:$DB_PORT/$DB_NAME"
echo "   Schema: $DB_SCHEMA"
echo "   Output: $OUTPUT_DIR/"

# Run SchemaSpy with comprehensive options
java -jar schemaspy.jar \
    -t pgsql \
    -host $DB_HOST \
    -port $DB_PORT \
    -db $DB_NAME \
    -u $DB_USER \
    -p $DB_PASSWORD \
    -s $DB_SCHEMA \
    -o $OUTPUT_DIR \
    -dp postgresql.jar \
    -hq \
    -norows \
    -degree 2 \
    -desc "USNDC (United States National Data Center) Seismic Analysis Schema - Comprehensive database for earthquake monitoring, nuclear test detection, and seismic event analysis. Contains 16 core tables including site locations, seismic origins, wave arrivals, and network information." \
    -meta schemaspy.meta

echo ""
echo "✅ SchemaSpy Documentation Generated!"
echo ""
echo "📊 Documentation Features:"
echo "   ✅ Interactive table browser"
echo "   ✅ Relationship diagrams (ER diagrams)"
echo "   ✅ Constraint analysis and validation"
echo "   ✅ Anomaly detection"
echo "   ✅ Column details and data types"
echo "   ✅ Foreign key relationships"
echo "   ✅ Index analysis"
echo "   ✅ Table statistics"
echo ""
echo "📁 Output Location: $OUTPUT_DIR/"
echo "🌐 Main Page: $OUTPUT_DIR/index.html"
echo ""
echo "📋 Next Steps:"
echo "   1. Review documentation locally: open $OUTPUT_DIR/index.html"
echo "   2. Deploy to AWS S3 for public access"
echo "   3. Test all interactive features"
echo ""
echo "🎉 Professional database documentation ready!"