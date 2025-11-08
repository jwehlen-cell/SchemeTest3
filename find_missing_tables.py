#!/usr/bin/env python3
"""
Find missing Oracle tables and their SQL definitions
"""

import oracledb
import re

def get_expected_tables():
    """Extract table names from Oracle schema file"""
    with open('usndc_oracle_schema_fixed.sql', 'r') as f:
        content = f.read()
    
    expected_tables = []
    for match in re.finditer(r'CREATE TABLE (\w+)', content, re.IGNORECASE):
        expected_tables.append(match.group(1).upper())
    
    return sorted(set(expected_tables))

def get_actual_tables():
    """Get table names from Oracle database"""
    dsn = oracledb.makedsn('usndc-oracle-db.c0320kayk04f.us-east-1.rds.amazonaws.com', 1521, service_name='ORCL')
    conn = oracledb.connect(user='oracleadmin', password='OracleTest2024!', dsn=dsn)
    
    cursor = conn.cursor()
    cursor.execute('SELECT TABLE_NAME FROM USER_TABLES ORDER BY TABLE_NAME')
    actual_tables = [row[0] for row in cursor.fetchall()]
    
    conn.close()
    return actual_tables

def find_missing_tables():
    """Compare expected vs actual tables"""
    expected = get_expected_tables()
    actual = get_actual_tables()
    
    missing = []
    for table in expected:
        if table not in actual:
            missing.append(table)
    
    return missing

def extract_table_definition(table_name):
    """Extract the CREATE TABLE statement for a specific table"""
    with open('usndc_oracle_schema_fixed.sql', 'r') as f:
        content = f.read()
    
    # Find the CREATE TABLE statement for this table
    pattern = rf'CREATE TABLE {table_name}.*?;'
    match = re.search(pattern, content, re.IGNORECASE | re.DOTALL)
    
    if match:
        return match.group(0).strip()
    return None

def main():
    print("🔍 ORACLE MISSING TABLES ANALYSIS")
    print("=" * 50)
    
    expected = get_expected_tables()
    actual = get_actual_tables()
    missing = find_missing_tables()
    
    print(f"📊 Expected tables: {len(expected)}")
    print(f"📊 Actual tables: {len(actual)}")
    print(f"❌ Missing tables: {len(missing)}")
    
    if missing:
        print(f"\n🚫 Missing tables ({len(missing)}):")
        for i, table in enumerate(missing, 1):
            print(f"{i:2d}. {table}")
        
        # Extract SQL definitions for missing tables
        print(f"\n📋 SQL Definitions for missing tables:")
        print("=" * 50)
        
        for table in missing:
            definition = extract_table_definition(table)
            if definition:
                print(f"\n-- {table}")
                print(definition)
                print()
            else:
                print(f"\n-- {table}: Definition not found")
    else:
        print("✅ All tables are present!")

if __name__ == "__main__":
    main()