#!/bin/bash

# Generate SchemaSpy Documentation from Oracle RDS (USNDC schema)
# Produces interactive HTML with relationship graphics using viz.js (no Graphviz required)

set -e

echo "🔍 Generating Oracle (USNDC) Schema Documentation with SchemaSpy..."

# Oracle RDS connection (from earlier deployment)
ORACLE_HOST="usndc-oracle-db.c0320kayk04f.us-east-1.rds.amazonaws.com"
ORACLE_PORT="1521"
ORACLE_SERVICE="ORCL"
ORACLE_USER="oracleadmin"
ORACLE_PASS="OracleTest2024!"
ORACLE_SCHEMA="ORACLEADMIN"
ORACLE_CATALOG="%"  # wildcard catalog for Oracle when required

# Artifacts
SCHEMASPY_JAR="aws/schemaspy.jar"
OJDBC_JAR="aws/ojdbc8.jar"
SCHEMASPY_VERSION="6.2.4"
OJDBC_VERSION="19.3.0.0"
OUTPUT_DIR="deploy-live/docs/oracle"

# Ensure output folders
mkdir -p "$OUTPUT_DIR"

# Check Java
if ! command -v java &> /dev/null; then
  echo "❌ Java not found. Please install Java 8+ and re-run."
  exit 1
fi

# Download SchemaSpy if missing
if [ ! -f "$SCHEMASPY_JAR" ]; then
  echo "📥 Downloading SchemaSpy ${SCHEMASPY_VERSION}..."
  curl -L "https://github.com/schemaspy/schemaspy/releases/download/v${SCHEMASPY_VERSION}/schemaspy-${SCHEMASPY_VERSION}.jar" -o "$SCHEMASPY_JAR"
  echo "✅ SchemaSpy downloaded"
fi

# Download Oracle JDBC driver if missing
if [ ! -f "$OJDBC_JAR" ]; then
  echo "📥 Downloading Oracle JDBC driver (ojdbc8 ${OJDBC_VERSION})..."
  curl -L "https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/${OJDBC_VERSION}/ojdbc8-${OJDBC_VERSION}.jar" -o "$OJDBC_JAR"
  echo "✅ Oracle JDBC driver downloaded"
fi

echo "📊 Running SchemaSpy (Oracle)..."
echo "   Host: $ORACLE_HOST:$ORACLE_PORT/$ORACLE_SERVICE"
echo "   Schema: $ORACLE_SCHEMA"
echo "   Output: $OUTPUT_DIR/"

# Clean previous output
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Determine diagram rendering options based on environment
JAVA_VERSION_STR=$(java -version 2>&1 | head -n1)
JAVA_MAJOR=8
if [[ "$JAVA_VERSION_STR" =~ version\ "1\.8.*" ]]; then
  JAVA_MAJOR=8
elif [[ "$JAVA_VERSION_STR" =~ version\ "([0-9]+)\..*" ]]; then
  JAVA_MAJOR=${BASH_REMATCH[1]}
fi

DIAGRAM_OPTS=""
# Allow tuning of Graphviz rendering via env var
GRAPHVIZ_ARGS_DEFAULT="-Gfontsize=10 -Nfontsize=9 -Efontsize=8 -Gnodesep=0.35 -Granksep=0.55"
GRAPHVIZ_ARGS=${GRAPHVIZ_ARGS:-$GRAPHVIZ_ARGS_DEFAULT}
if command -v dot >/dev/null 2>&1; then
  echo "🖼️  Graphviz 'dot' detected — generating static diagrams"
  DIAGRAM_OPTS=""
else
  if [ "$JAVA_MAJOR" -ge 11 ]; then
    echo "🧩 Using viz.js renderer (Java $JAVA_MAJOR)"
    DIAGRAM_OPTS="-vizjs"
  else
    echo "⚠️  No Graphviz found and Java <$JAVA_MAJOR lacks viz.js support. Proceeding without diagrams."
    DIAGRAM_OPTS="-noviz"
  fi
fi

# Generate docs using orathin parameters (SID/service provided via -db)
JAVA_CMD=(java -jar "$SCHEMASPY_JAR" \
  -t orathin \
  -host "$ORACLE_HOST" \
  -port "$ORACLE_PORT" \
  -db "$ORACLE_SERVICE" \
  -u "$ORACLE_USER" \
  -p "$ORACLE_PASS" \
  -s "$ORACLE_SCHEMA" \
  -cat "$ORACLE_CATALOG" \
  -dp "$OJDBC_JAR" \
  -o "$OUTPUT_DIR" \
  -hq \
  -norows \
  -noimplied \
  $DIAGRAM_OPTS \
  -degree 2 \
  -desc "USNDC Oracle operational schema (RDS 19c) – 177 tables, 101 foreign keys.")

# Append Graphviz args only if we are generating diagrams (not -noviz)
if [[ "$DIAGRAM_OPTS" != *"-noviz"* ]]; then
  JAVA_CMD+=( -gvArgs "$GRAPHVIZ_ARGS" )
fi

"${JAVA_CMD[@]}"

echo "✅ Oracle documentation generated: $OUTPUT_DIR/index.html"

# Optional: also publish under 'legacy' path for compatibility with existing links
mkdir -p deploy-live/docs/legacy
rm -rf deploy-live/docs/legacy/*
cp -R "$OUTPUT_DIR"/* deploy-live/docs/legacy/
echo "🔗 Also mirrored to: deploy-live/docs/legacy/index.html"

echo "💡 Next: Deploy with ./deploy-live/deploy.sh (uploads deploy-live/ to S3)"
