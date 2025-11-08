#!/usr/bin/env python3
"""
Deploy the fixed Oracle table definitions to complete the USNDC schema.
This script creates the remaining 13 tables that failed in the initial deployment.
"""

import os
import sys
import oracledb

def connect_to_oracle():
    """Establish connection to Oracle RDS database."""
    try:
        connection = oracledb.connect(
            user="oracleadmin",
            password="OracleTest2024!",
            host="usndc-oracle-db.c0320kayk04f.us-east-1.rds.amazonaws.com",
            port=1521,
            service_name="ORCL"
        )
        print("✅ Connected to Oracle database successfully")
        return connection
    except Exception as e:
        print(f"❌ Failed to connect to Oracle database: {e}")
        return None

def execute_sql_file(connection, filename):
    """Execute SQL statements from file."""
    if not os.path.exists(filename):
        print(f"❌ File {filename} not found")
        return False
        
    with open(filename, 'r') as f:
        content = f.read()
    
    # Split content into individual statements
    statements = []
    current_statement = ""
    
    for line in content.split('\n'):
        line = line.strip()
        if line.startswith('--') or not line:
            continue
            
        current_statement += " " + line
        if line.endswith(';'):
            statements.append(current_statement.strip()[:-1])  # Remove semicolon
            current_statement = ""
    
    cursor = connection.cursor()
    success_count = 0
    failed_statements = []
    
    for i, statement in enumerate(statements, 1):
        if not statement.strip():
            continue
            
        try:
            cursor.execute(statement)
            connection.commit()
            
            # Extract table name for success message
            if statement.upper().strip().startswith('CREATE TABLE'):
                table_name = statement.split()[2].split('(')[0].strip()
                print(f"✅ Table {i}: {table_name} created successfully")
                success_count += 1
            else:
                print(f"✅ Statement {i} executed successfully")
                success_count += 1
                
        except Exception as e:
            error_msg = str(e)
            failed_statements.append((i, statement[:100] + "...", error_msg))
            print(f"❌ Statement {i} failed: {error_msg}")
    
    cursor.close()
    return success_count, failed_statements

def verify_tables_created(connection):
    """Verify that all tables were created successfully."""
    expected_tables = [
        'CLASSIFICATION_DECLASSIFY_ON',
        'CLASSIFICATION_DERIVED_FROM', 
        'CLASSIFICATION_DISSEMINATION',
        'FEEDBACK',
        'FEEDBACK_SCREENSHOTS',
        'FILTER',
        'FILTER_GROUP',
        'ORIGIN_SDO',
        'SADO_PDF_REPORTS',
        'SADO_REPORT',
        'SADO_SCREENSHOTS',
        'SADO_STATE_CATEGORIES',
        'WFACTIVITY'
    ]
    
    cursor = connection.cursor()
    found_tables = []
    
    for table in expected_tables:
        try:
            cursor.execute(f"SELECT COUNT(*) FROM {table} WHERE ROWNUM <= 1")
            cursor.fetchone()
            found_tables.append(table)
            print(f"✅ {table} exists and is accessible")
        except Exception as e:
            print(f"❌ {table} not found or not accessible: {e}")
    
    cursor.close()
    return found_tables

def get_total_table_count(connection):
    """Get total number of tables in the database."""
    cursor = connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) 
        FROM user_tables 
        WHERE table_name NOT LIKE 'BIN$%'
    """)
    count = cursor.fetchone()[0]
    cursor.close()
    return count

def main():
    """Main execution function."""
    print("🚀 Deploying fixed Oracle table definitions...")
    print("=" * 60)
    
    # Connect to Oracle
    connection = connect_to_oracle()
    if not connection:
        sys.exit(1)
    
    # Get initial table count
    initial_count = get_total_table_count(connection)
    print(f"📊 Initial table count: {initial_count}")
    
    # Execute the fixed SQL file
    print("\n📝 Executing fixed table definitions...")
    success_count, failed_statements = execute_sql_file(connection, 'missing_tables_fixed.sql')
    
    # Get final table count
    final_count = get_total_table_count(connection)
    print(f"\n📊 Final table count: {final_count}")
    print(f"📈 Tables added: {final_count - initial_count}")
    
    # Verify specific tables
    print("\n🔍 Verifying created tables...")
    found_tables = verify_tables_created(connection)
    
    # Summary
    print("\n" + "=" * 60)
    print("📋 DEPLOYMENT SUMMARY:")
    print(f"✅ Successfully executed: {success_count} statements")
    print(f"✅ Tables verified: {len(found_tables)}/13")
    print(f"📊 Total tables in database: {final_count}")
    
    if failed_statements:
        print(f"❌ Failed statements: {len(failed_statements)}")
        for i, (stmt_num, stmt_preview, error) in enumerate(failed_statements, 1):
            print(f"   {i}. Statement {stmt_num}: {error}")
    
    # Check if we reached our target of 177 tables
    if final_count >= 177:
        print("🎉 SUCCESS: Complete 177-table Oracle schema deployment achieved!")
    else:
        print(f"⚠️  Progress: {final_count}/177 tables deployed ({(final_count/177)*100:.1f}%)")
    
    connection.close()
    print("🔐 Database connection closed")

if __name__ == "__main__":
    main()