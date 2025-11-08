#!/usr/bin/env python3
"""
Analyze specific foreign key failures and validate column existence.
Debug why the foreign keys are failing in our actual schema.
"""

import oracledb
import re

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
        return connection
    except Exception as e:
        print(f"❌ Failed to connect: {e}")
        return None

def check_table_and_columns(connection, table_name, column_name):
    """Check if a table and column exist."""
    cursor = connection.cursor()
    
    # Check if table exists
    cursor.execute("""
        SELECT COUNT(*) FROM user_tables 
        WHERE table_name = :table_name
    """, table_name=table_name.upper())
    
    table_exists = cursor.fetchone()[0] > 0
    
    if not table_exists:
        cursor.close()
        return False, False
    
    # Check if column exists
    cursor.execute("""
        SELECT COUNT(*) FROM user_tab_columns 
        WHERE table_name = :table_name AND column_name = :column_name
    """, table_name=table_name.upper(), column_name=column_name.upper())
    
    column_exists = cursor.fetchone()[0] > 0
    cursor.close()
    
    return table_exists, column_exists

def analyze_foreign_key_failures(connection):
    """Analyze why specific foreign keys are failing."""
    
    # Read the first few foreign keys from our fixed file
    with open('oracle_foreign_keys_fixed.sql', 'r') as f:
        foreign_keys = [line.strip() for line in f.readlines()[:10] if line.strip()]
    
    print("🔍 Analyzing Foreign Key Failures...")
    
    for i, fk_statement in enumerate(foreign_keys, 1):
        print(f"\n📋 FK {i}: {fk_statement[:80]}...")
        
        # Extract components
        table_match = re.search(r'ALTER TABLE (\w+)', fk_statement)
        child_col_match = re.search(r'FOREIGN KEY \((\w+)\)', fk_statement)
        ref_match = re.search(r'REFERENCES (\w+) \((\w+)\)', fk_statement)
        
        if not all([table_match, child_col_match, ref_match]):
            print("❌ Could not parse foreign key statement")
            continue
        
        child_table = table_match.group(1)
        child_column = child_col_match.group(1)
        parent_table = ref_match.group(1)
        parent_column = ref_match.group(2)
        
        print(f"   Child: {child_table}.{child_column} → Parent: {parent_table}.{parent_column}")
        
        # Check if tables and columns exist
        child_table_exists, child_col_exists = check_table_and_columns(connection, child_table, child_column)
        parent_table_exists, parent_col_exists = check_table_and_columns(connection, parent_table, parent_column)
        
        print(f"   Child table '{child_table}' exists: {child_table_exists}")
        print(f"   Child column '{child_column}' exists: {child_col_exists}")
        print(f"   Parent table '{parent_table}' exists: {parent_table_exists}")
        print(f"   Parent column '{parent_column}' exists: {parent_col_exists}")
        
        if all([child_table_exists, child_col_exists, parent_table_exists, parent_col_exists]):
            print("   ✅ All components exist - should work!")
            
            # Try to execute this specific foreign key
            cursor = connection.cursor()
            try:
                cursor.execute(fk_statement)
                connection.commit()
                print("   🎉 Successfully created this foreign key!")
            except Exception as e:
                print(f"   ❌ Still failed: {e}")
            cursor.close()
            
        else:
            print("   ❌ Missing components prevent foreign key creation")

def check_table_structure(connection, table_name):
    """Check the structure of a specific table."""
    cursor = connection.cursor()
    
    cursor.execute("""
        SELECT column_name, data_type, nullable, data_precision, data_scale
        FROM user_tab_columns 
        WHERE table_name = :table_name
        ORDER BY column_id
    """, table_name=table_name.upper())
    
    columns = cursor.fetchall()
    cursor.close()
    
    if columns:
        print(f"\n📋 Structure of table {table_name}:")
        for col_name, data_type, nullable, precision, scale in columns:
            nullable_str = "NULL" if nullable == 'Y' else "NOT NULL"
            if precision:
                type_str = f"{data_type}({precision}" + (f",{scale}" if scale else "") + ")"
            else:
                type_str = data_type
            print(f"   {col_name:<20} {type_str:<20} {nullable_str}")
    else:
        print(f"❌ Table {table_name} not found or no columns")

def main():
    connection = connect_to_oracle()
    if not connection:
        return
    
    # Analyze foreign key failures
    analyze_foreign_key_failures(connection)
    
    # Check structure of key tables
    check_table_structure(connection, 'AMP3C')
    check_table_structure(connection, 'ARRIVAL')
    check_table_structure(connection, 'AMPLITUDE')
    
    connection.close()

if __name__ == "__main__":
    main()