#!/usr/bin/env python3
"""
Carefully deploy Oracle foreign keys with proper error handling and cleanup.
This version processes one FK at a time with detailed validation.
"""

import oracledb
import sys
import re
import time

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

def clean_foreign_key_statement(fk_statement):
    """Clean and validate a foreign key statement."""
    # Remove any hidden characters and normalize whitespace
    fk_statement = ' '.join(fk_statement.split())
    
    # Ensure it ends with semicolon for parsing but remove for execution
    if fk_statement.endswith(';'):
        fk_statement = fk_statement[:-1]
    
    return fk_statement.strip()

def parse_foreign_key_components(fk_statement):
    """Parse components of a foreign key statement."""
    table_match = re.search(r'ALTER TABLE (\w+)', fk_statement, re.IGNORECASE)
    constraint_match = re.search(r'ADD CONSTRAINT (\w+)', fk_statement, re.IGNORECASE)
    child_col_match = re.search(r'FOREIGN KEY \((\w+)\)', fk_statement, re.IGNORECASE)
    ref_match = re.search(r'REFERENCES (\w+) \((\w+)\)', fk_statement, re.IGNORECASE)
    
    if not all([table_match, constraint_match, child_col_match, ref_match]):
        return None
    
    return {
        'child_table': table_match.group(1),
        'constraint_name': constraint_match.group(1),
        'child_column': child_col_match.group(1),
        'parent_table': ref_match.group(1),
        'parent_column': ref_match.group(2)
    }

def constraint_exists(connection, constraint_name):
    """Check if a constraint already exists."""
    cursor = connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) FROM user_constraints 
        WHERE constraint_name = :name
    """, name=constraint_name.upper())
    
    exists = cursor.fetchone()[0] > 0
    cursor.close()
    return exists

def deploy_single_foreign_key(connection, fk_statement):
    """Deploy a single foreign key with detailed error handling."""
    
    # Clean the statement
    clean_statement = clean_foreign_key_statement(fk_statement)
    
    # Parse components
    components = parse_foreign_key_components(clean_statement)
    if not components:
        return False, "Could not parse foreign key statement"
    
    # Check if constraint already exists
    if constraint_exists(connection, components['constraint_name']):
        return True, f"Constraint {components['constraint_name']} already exists"
    
    # Execute the foreign key creation
    cursor = connection.cursor()
    try:
        cursor.execute(clean_statement)
        connection.commit()
        cursor.close()
        return True, "Success"
        
    except Exception as e:
        connection.rollback()
        cursor.close()
        return False, str(e)

def read_and_clean_foreign_keys():
    """Read and clean foreign key statements from file."""
    try:
        with open('oracle_foreign_keys_fixed.sql', 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print("❌ oracle_foreign_keys_fixed.sql not found")
        return []
    
    # Process each line
    foreign_keys = []
    for line in lines:
        line = line.strip()
        if line and not line.startswith('--') and 'ALTER TABLE' in line.upper():
            foreign_keys.append(line)
    
    print(f"📋 Found {len(foreign_keys)} foreign key statements to process")
    return foreign_keys

def deploy_foreign_keys_carefully(connection):
    """Deploy foreign keys one at a time with careful error handling."""
    
    foreign_keys = read_and_clean_foreign_keys()
    if not foreign_keys:
        return 0, []
    
    success_count = 0
    failed_constraints = []
    existing_count = 0
    
    print(f"\n🔗 Processing {len(foreign_keys)} foreign keys...")
    
    for i, fk_statement in enumerate(foreign_keys, 1):
        components = parse_foreign_key_components(fk_statement)
        
        if components:
            constraint_name = components['constraint_name']
            child_table = components['child_table']
            
            print(f"FK {i:3d}: {constraint_name} on {child_table}", end=" ")
        else:
            print(f"FK {i:3d}: [Parse Error]", end=" ")
        
        success, message = deploy_single_foreign_key(connection, fk_statement)
        
        if success:
            if "already exists" in message:
                print("⚠️  Already exists")
                existing_count += 1
            else:
                print("✅ Success")
                success_count += 1
        else:
            print(f"❌ {message[:60]}...")
            failed_constraints.append((i, constraint_name if components else "Unknown", message))
        
        # Small delay to avoid overwhelming the database
        time.sleep(0.1)
    
    return success_count, failed_constraints, existing_count

def verify_final_foreign_keys(connection):
    """Verify final foreign key count and show sample relationships."""
    cursor = connection.cursor()
    
    # Get foreign key count
    cursor.execute("""
        SELECT COUNT(*) FROM user_constraints 
        WHERE constraint_type = 'R' AND constraint_name NOT LIKE 'BIN$%'
    """)
    fk_count = cursor.fetchone()[0]
    
    # Get sample foreign key relationships
    cursor.execute("""
        SELECT c.constraint_name,
               c.table_name as child_table,
               cc.column_name as child_column,
               r.table_name as parent_table,
               rc.column_name as parent_column
        FROM user_constraints c
        JOIN user_cons_columns cc ON c.constraint_name = cc.constraint_name
        JOIN user_constraints r ON c.r_constraint_name = r.constraint_name
        JOIN user_cons_columns rc ON r.constraint_name = rc.constraint_name
        WHERE c.constraint_type = 'R'
        AND c.constraint_name NOT LIKE 'BIN$%'
        ORDER BY c.constraint_name
        FETCH FIRST 10 ROWS ONLY
    """)
    
    sample_fks = cursor.fetchall()
    
    # Get constraint summary
    cursor.execute("""
        SELECT constraint_type, COUNT(*) as count
        FROM user_constraints 
        WHERE constraint_name NOT LIKE 'BIN$%'
        GROUP BY constraint_type
        ORDER BY constraint_type
    """)
    
    constraint_summary = cursor.fetchall()
    cursor.close()
    
    return fk_count, sample_fks, constraint_summary

def main():
    """Main execution function."""
    print("🚀 Carefully Deploying Oracle Foreign Key Constraints...")
    print("=" * 70)
    
    # Connect to Oracle
    connection = connect_to_oracle()
    if not connection:
        sys.exit(1)
    
    # Deploy foreign keys carefully
    success_count, failed_constraints, existing_count = deploy_foreign_keys_carefully(connection)
    
    # Verify final state
    fk_count, sample_fks, constraint_summary = verify_final_foreign_keys(connection)
    
    # Display results
    print(f"\n🔒 FINAL CONSTRAINT SUMMARY:")
    total_constraints = 0
    for constraint_type, count in constraint_summary:
        type_name = {
            'P': 'Primary Key',
            'R': 'Foreign Key', 
            'C': 'Check',
            'U': 'Unique'
        }.get(constraint_type, f'Type {constraint_type}')
        print(f"  {constraint_type}: {count:4d} - {type_name}")
        total_constraints += count
    
    print(f"  Total: {total_constraints} constraints")
    
    # Show sample relationships
    if sample_fks:
        print(f"\n🔗 SAMPLE FOREIGN KEY RELATIONSHIPS:")
        for fk_name, child_table, child_col, parent_table, parent_col in sample_fks:
            print(f"  📄 {child_table}.{child_col} → {parent_table}.{parent_col}")
    
    # Final summary
    print("\n" + "=" * 70)
    print("📋 DEPLOYMENT SUMMARY:")
    print(f"✅ New foreign keys deployed: {success_count}")
    print(f"⚠️  Already existing: {existing_count}")
    print(f"📊 Total foreign keys active: {fk_count}")
    print(f"❌ Failed deployments: {len(failed_constraints)}")
    
    if fk_count >= 50:
        print("🎉 SUCCESS: Substantial referential integrity established!")
        print("✅ Foreign key constraints enforce data consistency")
        print("✅ Schema has comprehensive relationship enforcement")
    elif fk_count > 0:
        print(f"⚠️  Partial success: {fk_count} foreign keys active")
    else:
        print("❌ No foreign keys successfully deployed")
    
    # Show first few failures for debugging
    if failed_constraints:
        print(f"\n❌ Sample Failures (first 3):")
        for i, (fk_num, constraint_name, error) in enumerate(failed_constraints[:3], 1):
            print(f"  {i}. {constraint_name}: {error[:80]}...")
    
    connection.close()
    print("🔐 Database connection closed")

if __name__ == "__main__":
    main()