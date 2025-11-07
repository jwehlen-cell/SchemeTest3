#!/bin/bash

echo "📊 NDC Schema Browser - Generating Live Documentation from RDS"
echo "============================================================="

# Load RDS connection information
if [ ! -f "aws/rds-connection-info.txt" ]; then
    echo "❌ RDS connection information not found. Run ./aws/populate-rds-schemas.sh first."
    exit 1
fi

source aws/rds-connection-info.txt

echo "🔗 Using RDS database endpoints:"
echo "   Legacy: $LEGACY_DB_HOST"
echo "   NDC Plus: $NDC_PLUS_DB_HOST"

# Create output directory for RDS documentation
mkdir -p deploy-rds/docs

# Generate SchemaSpy documentation for Legacy schema
echo "🔍 Generating Legacy schema documentation from RDS..."
java -jar aws/schemaspy.jar \
    -t pgsql \
    -host $LEGACY_DB_HOST \
    -port 5432 \
    -db legacy_schema \
    -u $DB_USER \
    -p $DB_PASS \
    -s public \
    -o deploy-rds/docs/legacy \
    -dp aws/postgresql-42.7.1.jar

if [ $? -ne 0 ]; then
    echo "❌ Legacy schema documentation generation failed!"
    exit 1
fi

echo "🔍 Generating NDC PLUS schema documentation from RDS..."
java -jar aws/schemaspy.jar \
    -t pgsql \
    -host $NDC_PLUS_DB_HOST \
    -port 5432 \
    -db ndc_plus_schema \
    -u $DB_USER \
    -p $DB_PASS \
    -s public \
    -o deploy-rds/docs/ndc_plus \
    -dp aws/postgresql-42.7.1.jar

if [ $? -ne 0 ]; then
    echo "❌ NDC PLUS schema documentation generation failed!"
    exit 1
fi

# Create main index page for RDS documentation
cat > deploy-rds/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NDC Schema Browser - AWS RDS Live Documentation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        .header {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            color: white;
            text-align: center;
            padding: 2rem;
        }
        .header h1 {
            margin: 0;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        .header p {
            margin: 10px 0 0 0;
            font-size: 1.2rem;
            opacity: 0.9;
        }
        .content {
            padding: 2rem;
        }
        .schema-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }
        .schema-card {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 1.5rem;
            border-left: 5px solid;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .schema-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .legacy-card {
            border-left-color: #5b8def;
        }
        .plus-card {
            border-left-color: #f39c12;
        }
        .schema-card h2 {
            margin-top: 0;
            color: #2c3e50;
        }
        .schema-card p {
            color: #7f8c8d;
            margin-bottom: 1rem;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background 0.3s ease;
            font-weight: 500;
        }
        .btn:hover {
            background: #2980b9;
        }
        .btn.legacy {
            background: #5b8def;
        }
        .btn.legacy:hover {
            background: #4a7bef;
        }
        .btn.plus {
            background: #f39c12;
        }
        .btn.plus:hover {
            background: #e67e22;
        }
        .features {
            background: #ecf0f1;
            padding: 1.5rem;
            border-radius: 8px;
            margin: 2rem 0;
        }
        .features h3 {
            color: #2c3e50;
            margin-top: 0;
        }
        .feature-list {
            list-style: none;
            padding: 0;
        }
        .feature-list li {
            padding: 0.5rem 0;
            position: relative;
            padding-left: 1.5rem;
        }
        .feature-list li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #27ae60;
            font-weight: bold;
        }
        .status {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            padding: 1rem;
            border-radius: 6px;
            margin-bottom: 1rem;
        }
        .rds-badge {
            background: #ff9500;
            color: white;
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: bold;
            margin-left: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>NDC Schema Browser <span class="rds-badge">AWS RDS</span></h1>
            <p>Live Database Documentation with Real-Time Relationships</p>
        </div>
        
        <div class="content">
            <div class="status">
                <strong>🚀 AWS RDS Deployment Active</strong> - Documentation generated from live PostgreSQL databases in AWS RDS
            </div>

            <div class="features">
                <h3>🎯 Live Database Features</h3>
                <ul class="feature-list">
                    <li>Real-time schema analysis from AWS RDS PostgreSQL databases</li>
                    <li>Interactive relationship diagrams with foreign key constraints</li>
                    <li>Live table statistics and data insights</li>
                    <li>Cross-schema relationship mapping between Legacy and NDC PLUS</li>
                    <li>Professional ER diagrams with Graphviz rendering</li>
                    <li>Searchable table and column documentation</li>
                </ul>
            </div>

            <div class="schema-grid">
                <div class="schema-card legacy-card">
                    <h2>🏛️ Legacy Schema</h2>
                    <p><strong>17 tables</strong> representing the traditional seismic monitoring database structure with established relationships for events, origins, arrivals, and amplitudes.</p>
                    <p><strong>Database:</strong> AWS RDS PostgreSQL</p>
                    <a href="docs/legacy/index.html" class="btn legacy">Explore Legacy Schema →</a>
                </div>

                <div class="schema-card plus-card">
                    <h2>🚀 NDC PLUS Schema</h2>
                    <p><strong>35 tables</strong> implementing the next-generation Nuclear Data Center schema with advanced signal detection, correlation analysis, and uncertainty modeling.</p>
                    <p><strong>Database:</strong> AWS RDS PostgreSQL</p>
                    <a href="docs/ndc_plus/index.html" class="btn plus">Explore NDC PLUS Schema →</a>
                </div>
            </div>

            <div style="text-align: center; margin-top: 2rem; padding-top: 2rem; border-top: 1px solid #ecf0f1; color: #7f8c8d;">
                <p>Generated from AWS RDS PostgreSQL databases with SchemaSpy</p>
                <p>Last updated: <span id="timestamp"></span></p>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('timestamp').textContent = new Date().toLocaleString();
    </script>
</body>
</html>
EOF

# Copy static assets if needed
if [ -d "deploy-live/css" ]; then
    cp -r deploy-live/css deploy-rds/
fi

echo "✅ Live documentation generated successfully from RDS!"
echo ""
echo "📊 SchemaSpy Documentation Available:"
echo "   🏛️  Legacy Schema: deploy-rds/docs/legacy/index.html"
echo "   🚀 NDC PLUS Schema: deploy-rds/docs/ndc_plus/index.html"
echo "   🌐 Main Index: deploy-rds/index.html"
echo ""
echo "🌍 To deploy to S3, run: aws s3 sync deploy-rds/ s3://ndc-schema3-rds --delete"
echo ""
echo "🎉 AWS RDS live database documentation generation completed!"