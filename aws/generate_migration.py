#!/usr/bin/env python3
"""
Generate schema update SQL for NDC PLUS database in AWS RDS
Compares current database schema with NDC_PLUS_tables.txt to identify missing columns
"""

import psycopg2
import re
from typing import Dict, List, Tuple

# Database connection details
DB_HOST = "ndc-plus-schema.c0320kayk04f.us-east-1.rds.amazonaws.com"
DB_PORT = "5432"
DB_NAME = "ndc_plus_schema"
DB_USER = "schemaadmin"
DB_PASS = "SchemaTest2024!"

def oracle_to_postgres_type(oracle_type: str) -> str:
    """Convert Oracle data types to PostgreSQL equivalents."""
    oracle_type = oracle_type.strip()
    
    # Handle NOT NULL separately
    not_null = ""
    if oracle_type.startswith("NOT NULL "):
        not_null = " NOT NULL"
        oracle_type = oracle_type[9:]  # Remove "NOT NULL "
    
    # Type mappings
    if oracle_type == "RAW(16)":
        return "UUID" + not_null
    elif oracle_type.startswith("VARCHAR2("):
        size = oracle_type[9:-1]  # Extract size
        return f"VARCHAR({size})" + not_null
    elif oracle_type == "TIMESTAMP(6)":
        return "TIMESTAMP(6) WITHOUT TIME ZONE" + not_null
    elif oracle_type == "NUMBER(18)":
        return "BIGINT" + not_null
    elif oracle_type.startswith("NUMBER("):
        # Extract precision and scale
        params = oracle_type[7:-1]
        if "," in params:
            precision, scale = params.split(",")
            return f"NUMERIC({precision},{scale})" + not_null
        else:
            return f"NUMERIC({params})" + not_null
    elif oracle_type == "CLOB":
        return "TEXT" + not_null
    elif oracle_type.startswith("VARCHAR2("):
        size = oracle_type[9:-1]
        return f"VARCHAR({size})" + not_null
    else:
        return oracle_type + not_null

def parse_ndc_plus_tables() -> Dict[str, List[Tuple[str, str]]]:
    """Parse NDC_PLUS_tables.txt to extract table and column definitions."""
    tables = {}
    current_table = None
    
    with open('NDC_PLUS_tables.txt', 'r') as f:
        lines = f.readlines()
    
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        
        if line.startswith("TABLE: "):
            current_table = line[7:].strip().lower()
            tables[current_table] = []
            # Skip header lines
            i += 3  # Skip the column header and separator lines
            continue
        
        # Parse column definition
        if current_table and line and not line.startswith("TABLE:"):
            # Split the line to extract column name and type
            if len(line) > 42:  # Ensure line is long enough
                column_name = line[1:42].strip()
                column_type = line[42:].strip()
                
                if column_name and column_type:
                    tables[current_table].append((column_name.lower(), column_type))
        
        i += 1
    
    return tables

def get_current_schema() -> Dict[str, List[str]]:
    """Get current database schema from RDS."""
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASS
    )
    
    current_schema = {}
    
    try:
        cursor = conn.cursor()
        
        # Get all tables
        cursor.execute("""
            SELECT table_name 
            FROM information_schema.tables 
            WHERE table_schema = 'public' 
            AND table_type = 'BASE TABLE'
            ORDER BY table_name
        """)
        
        tables = [row[0] for row in cursor.fetchall()]
        
        # Get columns for each table
        for table in tables:
            cursor.execute("""
                SELECT column_name
                FROM information_schema.columns 
                WHERE table_schema = 'public' 
                AND table_name = %s
                ORDER BY ordinal_position
            """, (table,))
            
            columns = [row[0] for row in cursor.fetchall()]
            current_schema[table] = columns
            
    finally:
        conn.close()
    
    return current_schema

def generate_migration_sql() -> List[str]:
    """Generate SQL statements to add missing columns."""
    print("📋 Parsing NDC_PLUS_tables.txt...")
    target_schema = parse_ndc_plus_tables()
    
    print("🔍 Getting current RDS schema...")
    current_schema = get_current_schema()
    
    migration_statements = []
    
    print("🔄 Comparing schemas...")
    for table_name, target_columns in target_schema.items():
        if table_name in current_schema:
            current_columns = set(current_schema[table_name])
            
            for column_name, oracle_type in target_columns:
                if column_name not in current_columns:
                    postgres_type = oracle_to_postgres_type(oracle_type)
                    sql = f"ALTER TABLE {table_name} ADD COLUMN {column_name} {postgres_type};"
                    migration_statements.append(sql)
                    print(f"  ➕ {table_name}.{column_name} ({oracle_type} -> {postgres_type})")
        else:
            print(f"  ⚠️  Table {table_name} not found in current schema")
    
    return migration_statements

def main():
    print("🚀 NDC PLUS Database Schema Migration Generator")
    print("=" * 50)
    
    try:
        migration_sql = generate_migration_sql()
        
        if migration_sql:
            print(f"\n📝 Generated {len(migration_sql)} migration statements:")
            print("\n-- NDC PLUS Schema Migration SQL")
            print("-- Generated on", __import__('datetime').datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
            print()
            
            for sql in migration_sql:
                print(sql)
            
            # Write to file
            with open('aws/ndc_plus_schema_migration.sql', 'w') as f:
                f.write("-- NDC PLUS Schema Migration SQL\n")
                f.write(f"-- Generated on {__import__('datetime').datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
                f.write("-- Adds missing columns to existing tables\n\n")
                
                for sql in migration_sql:
                    f.write(sql + "\n")
            
            print(f"\n💾 Migration SQL saved to: aws/ndc_plus_schema_migration.sql")
        else:
            print("✅ No schema changes needed - all columns are present!")
    
    except Exception as e:
        print(f"❌ Error: {e}")
        return 1
    
    return 0

if __name__ == '__main__':
    exit(main())