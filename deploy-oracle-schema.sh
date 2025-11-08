#!/bin/bash

# Oracle Database Deployment Script for USNDC Schema
# This script will deploy the complete 177-table Oracle schema

set -e

ORACLE_HOST=""
ORACLE_PORT="1521"
ORACLE_SID="ORCL"
ORACLE_USER="oracleadmin"
ORACLE_PASS="OracleTest2024!"
SCHEMA_FILE="usndc_oracle_schema_fixed.sql"

echo "🚀 USNDC Oracle Schema Deployment"
echo "=================================="

# Function to get Oracle endpoint from CloudFormation
get_oracle_endpoint() {
    echo "📍 Getting Oracle database endpoint..."
    ORACLE_HOST=$(aws cloudformation describe-stacks --stack-name usndc-oracle --query 'Stacks[0].Outputs[?OutputKey==`OracleEndpoint`].OutputValue' --output text)
    
    if [ -z "$ORACLE_HOST" ]; then
        echo "❌ Failed to get Oracle endpoint. Is the stack ready?"
        exit 1
    fi
    
    echo "✅ Oracle endpoint: $ORACLE_HOST"
}

# Function to test Oracle connection using Docker
test_oracle_connection() {
    echo "🔗 Testing Oracle database connection..."
    
    echo "SELECT 'Connection successful!' FROM DUAL;" | docker run --rm -i \
        -e ORACLE_HOST="$ORACLE_HOST" \
        -e ORACLE_PORT="$ORACLE_PORT" \
        -e ORACLE_SID="$ORACLE_SID" \
        -e ORACLE_USER="$ORACLE_USER" \
        -e ORACLE_PASS="$ORACLE_PASS" \
        gvenzl/oracle-sqlcl:latest \
        sql -s "$ORACLE_USER/$ORACLE_PASS@//$ORACLE_HOST:$ORACLE_PORT/$ORACLE_SID"
    
    if [ $? -eq 0 ]; then
        echo "✅ Oracle connection successful!"
    else
        echo "❌ Oracle connection failed!"
        exit 1
    fi
}

# Function to deploy Oracle schema
deploy_oracle_schema() {
    echo "📋 Deploying Oracle schema (177 tables)..."
    
    if [ ! -f "$SCHEMA_FILE" ]; then
        echo "❌ Schema file not found: $SCHEMA_FILE"
        exit 1
    fi
    
    echo "📊 Schema file statistics:"
    wc -l "$SCHEMA_FILE"
    du -h "$SCHEMA_FILE"
    
    echo "🚀 Starting Oracle schema deployment..."
    
    docker run --rm -i \
        -v "$(pwd):/workspace" \
        -e ORACLE_HOST="$ORACLE_HOST" \
        -e ORACLE_PORT="$ORACLE_PORT" \
        -e ORACLE_SID="$ORACLE_SID" \
        -e ORACLE_USER="$ORACLE_USER" \
        -e ORACLE_PASS="$ORACLE_PASS" \
        gvenzl/oracle-sqlcl:latest \
        sql "$ORACLE_USER/$ORACLE_PASS@//$ORACLE_HOST:$ORACLE_PORT/$ORACLE_SID" @/workspace/"$SCHEMA_FILE" > oracle_deployment.log 2>&1
    
    if [ $? -eq 0 ]; then
        echo "✅ Oracle schema deployment completed!"
    else
        echo "❌ Oracle schema deployment failed. Check oracle_deployment.log"
        tail -20 oracle_deployment.log
        exit 1
    fi
}

# Function to verify table count
verify_tables() {
    echo "🔍 Verifying table deployment..."
    
    TABLE_COUNT=$(echo "SELECT COUNT(*) FROM USER_TABLES;" | docker run --rm -i \
        -e ORACLE_HOST="$ORACLE_HOST" \
        -e ORACLE_PORT="$ORACLE_PORT" \
        -e ORACLE_SID="$ORACLE_SID" \
        -e ORACLE_USER="$ORACLE_USER" \
        -e ORACLE_PASS="$ORACLE_PASS" \
        gvenzl/oracle-sqlcl:latest \
        sql -s "$ORACLE_USER/$ORACLE_PASS@//$ORACLE_HOST:$ORACLE_PORT/$ORACLE_SID" | grep -o '[0-9]*')
    
    echo "📊 Tables created: $TABLE_COUNT"
    
    if [ "$TABLE_COUNT" = "177" ]; then
        echo "✅ All 177 tables successfully created!"
    else
        echo "⚠️  Expected 177 tables, found $TABLE_COUNT"
        echo "📋 Listing created tables..."
        echo "SELECT TABLE_NAME FROM USER_TABLES ORDER BY TABLE_NAME;" | docker run --rm -i \
            -e ORACLE_HOST="$ORACLE_HOST" \
            -e ORACLE_PORT="$ORACLE_PORT" \
            -e ORACLE_SID="$ORACLE_SID" \
            -e ORACLE_USER="$ORACLE_USER" \
            -e ORACLE_PASS="$ORACLE_PASS" \
            gvenzl/oracle-sqlcl:latest \
            sql -s "$ORACLE_USER/$ORACLE_PASS@//$ORACLE_HOST:$ORACLE_PORT/$ORACLE_SID"
    fi
}

# Main deployment process
main() {
    echo "Starting Oracle deployment process..."
    
    get_oracle_endpoint
    test_oracle_connection
    deploy_oracle_schema
    verify_tables
    
    echo ""
    echo "🎉 USNDC Oracle deployment completed!"
    echo "📊 Database: $ORACLE_HOST:$ORACLE_PORT/$ORACLE_SID"
    echo "👤 Username: $ORACLE_USER"
    echo "📋 Tables: Verify count above"
}

# Check if we're being called with specific functions
case "${1:-main}" in
    "get-endpoint")
        get_oracle_endpoint
        echo "Oracle endpoint: $ORACLE_HOST"
        ;;
    "test")
        get_oracle_endpoint
        test_oracle_connection
        ;;
    "deploy")
        get_oracle_endpoint
        deploy_oracle_schema
        ;;
    "verify")
        get_oracle_endpoint
        verify_tables
        ;;
    *)
        main
        ;;
esac