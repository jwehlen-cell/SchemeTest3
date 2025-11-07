#!/bin/bash

# Generate USNDC Schema Documentation
# Uses SchemaSpy to generate interactive documentation from the live database

set -e

echo "📚 Generating USNDC Schema Documentation"
echo "======================================="

# Load connection information
if [ -f "usndc-connection-info.txt" ]; then
    source usndc-connection-info.txt
    echo "✅ Loaded connection information"
else
    echo "❌ Connection info file not found. Please run deploy-usndc-database.sh first"
    exit 1
fi

# Configuration
DOCS_OUTPUT_DIR="usndc_docs"
SCHEMASPY_JAR="schemaspy.jar"
POSTGRESQL_JAR="postgresql.jar"

echo "Output Directory: $DOCS_OUTPUT_DIR"
echo "Database Host: $DB_HOST"
echo "Database Name: $DB_NAME"
echo ""

# Download SchemaSpy if not present
if [ ! -f "$SCHEMASPY_JAR" ]; then
    echo "📥 Downloading SchemaSpy..."
    curl -L -o "$SCHEMASPY_JAR" "https://github.com/schemaspy/schemaspy/releases/download/v6.2.4/schemaspy-6.2.4.jar"
    echo "✅ SchemaSpy downloaded"
fi

# Download PostgreSQL JDBC driver if not present
if [ ! -f "$POSTGRESQL_JAR" ]; then
    echo "📥 Downloading PostgreSQL JDBC driver..."
    curl -L -o "$POSTGRESQL_JAR" "https://jdbc.postgresql.org/download/postgresql-42.7.1.jar"
    echo "✅ PostgreSQL JDBC driver downloaded"
fi

# Check Java availability
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed or not in PATH"
    echo "Please install Java 8 or later"
    exit 1
fi

# Test database connection
echo ""
echo "🔌 Testing database connection..."
if ! psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "SELECT version();" > /dev/null 2>&1; then
    echo "❌ Cannot connect to database"
    exit 1
fi

export PGPASSWORD="$DB_PASSWORD"
echo "✅ Database connection successful"

# Clean previous documentation
if [ -d "$DOCS_OUTPUT_DIR" ]; then
    echo "🧹 Cleaning previous documentation..."
    rm -rf "$DOCS_OUTPUT_DIR"
fi

# Generate documentation
echo ""
echo "📖 Generating schema documentation with SchemaSpy..."
echo "   This may take several minutes for 177 tables..."

java -jar "$SCHEMASPY_JAR" \
    -t pgsql \
    -dp "$POSTGRESQL_JAR" \
    -host "$DB_HOST" \
    -port "$DB_PORT" \
    -db "$DB_NAME" \
    -u "$DB_USER" \
    -p "$DB_PASSWORD" \
    -s public \
    -o "$DOCS_OUTPUT_DIR" \
    -hq \
    -norows \
    -degree 2

if [ $? -eq 0 ]; then
    echo "✅ Schema documentation generated successfully"
else
    echo "❌ Schema documentation generation failed"
    exit 1
fi

# Create enhanced index page
echo ""
echo "🎨 Creating enhanced documentation index..."
cat > "$DOCS_OUTPUT_DIR/enhanced_index.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>USNDC Schema Documentation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .header {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            padding: 40px;
            text-align: center;
        }
        .header h1 {
            margin: 0 0 10px 0;
            font-size: 2.5em;
            font-weight: 300;
        }
        .header p {
            margin: 0;
            font-size: 1.2em;
            opacity: 0.9;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 40px;
            background: #f8f9fa;
        }
        .stat-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .stat-card:hover {
            transform: translateY(-5px);
        }
        .stat-number {
            font-size: 3em;
            font-weight: bold;
            color: #3498db;
            margin-bottom: 10px;
        }
        .stat-label {
            font-size: 1.1em;
            color: #7f8c8d;
            font-weight: 500;
        }
        .navigation {
            padding: 40px;
        }
        .nav-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .nav-card {
            background: white;
            border: 2px solid #ecf0f1;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            text-decoration: none;
            color: inherit;
            transition: all 0.3s ease;
        }
        .nav-card:hover {
            border-color: #3498db;
            box-shadow: 0 10px 30px rgba(52, 152, 219, 0.2);
            transform: translateY(-3px);
        }
        .nav-icon {
            font-size: 3em;
            margin-bottom: 20px;
        }
        .nav-title {
            font-size: 1.4em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #2c3e50;
        }
        .nav-desc {
            color: #7f8c8d;
            line-height: 1.5;
        }
        .footer {
            text-align: center;
            padding: 30px;
            color: #7f8c8d;
            border-top: 1px solid #ecf0f1;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🌍 USNDC Schema Documentation</h1>
            <p>United States National Data Center - Seismic Monitoring Database</p>
        </div>

        <div class="stats">
            <div class="stat-card">
                <div class="stat-number">177</div>
                <div class="stat-label">Database Tables</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">1,876</div>
                <div class="stat-label">Total Columns</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">210+</div>
                <div class="stat-label">Relationships</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">31</div>
                <div class="stat-label">Primary Keys</div>
            </div>
        </div>

        <div class="navigation">
            <div class="nav-grid">
                <a href="index.html" class="nav-card">
                    <div class="nav-icon">📊</div>
                    <div class="nav-title">Schema Overview</div>
                    <div class="nav-desc">Browse all tables, relationships, and database structure</div>
                </a>
                
                <a href="tables.html" class="nav-card">
                    <div class="nav-icon">🗃️</div>
                    <div class="nav-title">Table Browser</div>
                    <div class="nav-desc">Explore individual tables, columns, and constraints</div>
                </a>
                
                <a href="relationships.html" class="nav-card">
                    <div class="nav-icon">🔗</div>
                    <div class="nav-title">Relationships</div>
                    <div class="nav-desc">View foreign key relationships and dependencies</div>
                </a>
                
                <a href="constraints.html" class="nav-card">
                    <div class="nav-icon">🔐</div>
                    <div class="nav-title">Constraints</div>
                    <div class="nav-desc">Database constraints, keys, and integrity rules</div>
                </a>
            </div>
        </div>

        <div class="footer">
            <p>Generated with SchemaSpy • USNDC Schema Browser • Comprehensive Seismic Data Management</p>
        </div>
    </div>
</body>
</html>
EOF

echo "✅ Enhanced documentation index created"

# Verify documentation
echo ""
echo "🔍 Verifying documentation..."
if [ -f "$DOCS_OUTPUT_DIR/index.html" ] && [ -f "$DOCS_OUTPUT_DIR/tables.html" ]; then
    echo "✅ Documentation files generated successfully"
    
    # Count generated files
    FILE_COUNT=$(find "$DOCS_OUTPUT_DIR" -name "*.html" | wc -l | tr -d ' ')
    echo "   HTML files generated: $FILE_COUNT"
    
    # Check for diagrams
    DIAGRAM_COUNT=$(find "$DOCS_OUTPUT_DIR" -name "*.png" | wc -l | tr -d ' ')
    echo "   Diagrams generated: $DIAGRAM_COUNT"
    
else
    echo "❌ Documentation generation incomplete"
    exit 1
fi

echo ""
echo "🎉 USNDC Schema Documentation Complete!"
echo "====================================="
echo ""
echo "📁 Documentation Location: $DOCS_OUTPUT_DIR/"
echo "🌐 Main Page: $DOCS_OUTPUT_DIR/enhanced_index.html"
echo "📊 Schema Overview: $DOCS_OUTPUT_DIR/index.html"
echo ""
echo "💡 View Documentation:"
echo "   Open: file://$(pwd)/$DOCS_OUTPUT_DIR/enhanced_index.html"
echo ""
echo "🚀 Next Steps:"
echo "   1. Review the generated documentation"
echo "   2. Deploy to web hosting (S3, etc.) if desired"
echo "   3. Share with team members"