#!/bin/bash

# Generate SchemaSpy documentation for NDC Plus 2 database
# This script creates browser-based documentation using SchemaSpy

set -e

echo "Generating SchemaSpy documentation for NDC Plus 2 database..."

# Database connection parameters
DB_HOST="ndc-plus2-schema.c0320kayk04f.us-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_NAME="ndc_plus2_schema"
DB_USER="schemaadmin"
export PGPASSWORD="SchemaTest2024!"

# Create output directory
OUTPUT_DIR="ndc_plus2_docs"
mkdir -p "$OUTPUT_DIR"

echo "Downloading SchemaSpy if not present..."
if [ ! -f "schemaspy.jar" ]; then
    curl -L -o schemaspy.jar https://github.com/schemaspy/schemaspy/releases/download/v6.2.4/schemaspy-6.2.4.jar
fi

echo "Downloading PostgreSQL JDBC driver if not present..."
if [ ! -f "postgresql.jar" ]; then
    curl -L -o postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.7.1.jar
fi

echo "Running SchemaSpy to generate documentation..."
java -jar schemaspy.jar \
  -t pgsql \
  -host "$DB_HOST" \
  -port "$DB_PORT" \
  -db "$DB_NAME" \
  -u "$DB_USER" \
  -p "$PGPASSWORD" \
  -o "$OUTPUT_DIR" \
  -dp postgresql.jar \
  -s public \
  -norows \
  -desc "NDC Plus 2 Schema Documentation" \
  -connprops "sslmode\\=require"

echo "SchemaSpy documentation generated successfully!"
echo "Documentation location: ./$OUTPUT_DIR/index.html"

# Create a simple index page that links to all three schemas
echo "Creating unified index page..."
cat > unified_index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NDC Schema Documentation Hub</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .header {
            text-align: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .schema-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        .schema-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .schema-card:hover {
            transform: translateY(-5px);
        }
        .schema-title {
            color: #333;
            margin-bottom: 15px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }
        .schema-description {
            color: #666;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .view-button {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 5px;
            transition: opacity 0.3s ease;
        }
        .view-button:hover {
            opacity: 0.9;
        }
        .stats {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin: 15px 0;
        }
        .stat-item {
            display: inline-block;
            margin-right: 20px;
            color: #666;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            color: #666;
            border-top: 1px solid #eee;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>NDC Schema Documentation Hub</h1>
        <p>Comprehensive database schema documentation for Nuclear Detection and Characterization systems</p>
    </div>

    <div class="schema-grid">
        <div class="schema-card">
            <h2 class="schema-title">Legacy Schema</h2>
            <div class="schema-description">
                Original NDC database schema containing historical seismic event data, station information, and traditional monitoring capabilities.
            </div>
            <div class="stats">
                <div class="stat-item"><strong>Database:</strong> legacy_schema</div>
                <div class="stat-item"><strong>Type:</strong> PostgreSQL</div>
            </div>
            <a href="legacy_docs/index.html" class="view-button">View Legacy Schema</a>
        </div>

        <div class="schema-card">
            <h2 class="schema-title">NDC Plus Schema</h2>
            <div class="schema-description">
                Enhanced NDC database schema with improved data structures for modern seismic monitoring, enhanced event processing, and advanced analytics.
            </div>
            <div class="stats">
                <div class="stat-item"><strong>Database:</strong> ndc_plus_schema</div>
                <div class="stat-item"><strong>Type:</strong> PostgreSQL</div>
            </div>
            <a href="ndc_plus_docs/index.html" class="view-button">View NDC Plus Schema</a>
        </div>

        <div class="schema-card">
            <h2 class="schema-title">NDC Plus 2 Schema</h2>
            <div class="schema-description">
                Latest generation NDC database schema featuring advanced signal detection, location solutions, amplitude measurements, and comprehensive quality control systems.
            </div>
            <div class="stats">
                <div class="stat-item"><strong>Database:</strong> ndc_plus2_schema</div>
                <div class="stat-item"><strong>Type:</strong> PostgreSQL</div>
                <div class="stat-item"><strong>Tables:</strong> 22</div>
            </div>
            <a href="ndc_plus2_docs/index.html" class="view-button">View NDC Plus 2 Schema</a>
        </div>
    </div>

    <div class="footer">
        <p>Generated by SchemaSpy • Last Updated: $(date)</p>
        <p>AWS RDS PostgreSQL Databases • Auto-generated Documentation</p>
    </div>
</body>
</html>
EOF

echo "Unified index page created: unified_index.html"
echo ""
echo "Documentation Generation Complete!"
echo "======================================="
echo "NDC Plus 2 Schema: ./$OUTPUT_DIR/index.html"
echo "Unified Hub: ./unified_index.html"
echo ""
echo "Next steps:"
echo "1. Upload to S3 for web hosting"
echo "2. Update existing documentation links"
echo "3. Verify all three schemas are accessible"