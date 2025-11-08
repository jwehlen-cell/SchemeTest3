#!/usr/bin/env python3
"""
Final cleanup and deployment of remaining foreign keys.
Handle missing columns and deploy all corrected foreign keys.
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

def check_table_structure(connection, table_name):
    """Check the actual structure of a table."""
    cursor = connection.cursor()
    
    cursor.execute("""
        SELECT column_name, data_type, nullable
        FROM user_tab_columns 
        WHERE table_name = :table_name
        ORDER BY column_id
    """, table_name=table_name.upper())
    
    columns = cursor.fetchall()
    cursor.close()
    return columns

def create_final_foreign_key_file(connection):
    """Create a final foreign key file with only valid constraints."""
    print("🔧 Creating Final Foreign Key File...")
    
    # Read the fixed foreign keys
    with open('oracle_foreign_keys_remaining.sql', 'r') as f:
        lines = f.readlines()
    
    valid_fks = []
    invalid_fks = []
    
    for line in lines:
        line = line.strip()
        if not line:
            continue
        
        # Parse the foreign key to check validity
        table_match = re.search(r'ALTER TABLE (\w+)', line)
        child_col_match = re.search(r'FOREIGN KEY \((\w+)\)', line)
        ref_match = re.search(r'REFERENCES (\w+) \((\w+)\)', line)
        
        if not all([table_match, child_col_match, ref_match]):
            invalid_fks.append(line)
            continue
        
        child_table = table_match.group(1)
        child_column = child_col_match.group(1)
        parent_table = ref_match.group(1)
        parent_column = ref_match.group(2)
        
        # Check if columns exist
        child_columns = check_table_structure(connection, child_table)
        parent_columns = check_table_structure(connection, parent_table)
        
        child_col_exists = any(col[0] == child_column.upper() for col in child_columns)
        parent_col_exists = any(col[0] == parent_column.upper() for col in parent_columns)
        
        if child_col_exists and parent_col_exists:
            valid_fks.append(line)
        else:
            invalid_fks.append(line)
            if not child_col_exists:
                print(f"   ❌ Skipping FK: Column {child_table}.{child_column} does not exist")
            if not parent_col_exists:
                print(f"   ❌ Skipping FK: Column {parent_table}.{parent_column} does not exist")
    
    # Write final valid foreign keys
    with open('oracle_foreign_keys_final.sql', 'w') as f:
        for fk in valid_fks:
            f.write(fk + '\n')
    
    print(f"   ✅ Valid foreign keys: {len(valid_fks)}")
    print(f"   ❌ Invalid foreign keys skipped: {len(invalid_fks)}")
    
    return valid_fks

def deploy_final_foreign_keys(connection, foreign_keys):
    """Deploy the final set of valid foreign keys."""
    cursor = connection.cursor()
    
    print(f"\n🚀 Deploying {len(foreign_keys)} Final Foreign Keys...")
    
    success_count = 0
    failed_count = 0
    existing_count = 0
    
    for i, fk_statement in enumerate(foreign_keys, 1):
        # Extract constraint name for reporting
        constraint_match = re.search(r'ADD CONSTRAINT (\w+)', fk_statement)
        constraint_name = constraint_match.group(1) if constraint_match else f"FK_{i}"
        
        # Check if constraint already exists
        cursor.execute("""
            SELECT COUNT(*) FROM user_constraints 
            WHERE constraint_name = :name
        """, name=constraint_name.upper())
        
        if cursor.fetchone()[0] > 0:
            print(f"FK {i:3d}: {constraint_name:<30} ⚠️  Already exists")
            existing_count += 1
            continue
        
        # Try to create the foreign key
        try:
            cursor.execute(fk_statement)
            connection.commit()
            print(f"FK {i:3d}: {constraint_name:<30} ✅ Success")
            success_count += 1
            
        except Exception as e:
            connection.rollback()
            error_msg = str(e)[:50]
            print(f"FK {i:3d}: {constraint_name:<30} ❌ {error_msg}...")
            failed_count += 1
    
    cursor.close()
    return success_count, existing_count, failed_count

def get_final_statistics(connection):
    """Get final statistics on the complete schema."""
    cursor = connection.cursor()
    
    # Get constraint counts
    cursor.execute("""
        SELECT constraint_type, COUNT(*) as count
        FROM user_constraints 
        WHERE constraint_name NOT LIKE 'BIN$%'
        GROUP BY constraint_type
        ORDER BY constraint_type
    """)
    constraints = cursor.fetchall()
    
    # Get table count
    cursor.execute("""
        SELECT COUNT(*) FROM user_tables 
        WHERE table_name NOT LIKE 'BIN$%'
    """)
    table_count = cursor.fetchone()[0]
    
    # Get foreign key sample
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
        FETCH FIRST 5 ROWS ONLY
    """)
    
    fk_samples = cursor.fetchall()
    cursor.close()
    
    return constraints, table_count, fk_samples

def main():
    """Main execution function."""
    print("🚀 Final Foreign Key Cleanup and Deployment...")
    print("=" * 70)
    
    # Connect to Oracle
    connection = connect_to_oracle()
    if not connection:
        return
    
    # Create final foreign key file with only valid constraints
    valid_fks = create_final_foreign_key_file(connection)
    
    # Deploy the final foreign keys
    success_count, existing_count, failed_count = deploy_final_foreign_keys(connection, valid_fks)
    
    # Get final statistics
    constraints, table_count, fk_samples = get_final_statistics(connection)
    
    # Display results
    print(f"\n🔒 FINAL SCHEMA STATISTICS:")
    print(f"  📄 Tables: {table_count}")
    
    total_constraints = 0
    fk_count = 0
    
    for constraint_type, count in constraints:
        type_name = {
            'P': 'Primary Key',
            'R': 'Foreign Key', 
            'C': 'Check',
            'U': 'Unique'
        }.get(constraint_type, f'Type {constraint_type}')
        print(f"  {constraint_type}: {count:4d} - {type_name}")
        total_constraints += count
        if constraint_type == 'R':
            fk_count = count
    
    print(f"  Total: {total_constraints} constraints")
    
    # Show sample relationships
    if fk_samples:
        print(f"\n🔗 SAMPLE FOREIGN KEY RELATIONSHIPS:")
        for fk_name, child_table, child_col, parent_table, parent_col in fk_samples:
            print(f"  📄 {child_table}.{child_col} → {parent_table}.{parent_col}")
    
    # Final summary
    print("\n" + "=" * 70)
    print("📋 FINAL DEPLOYMENT SUMMARY:")
    print(f"✅ New foreign keys deployed: {success_count}")
    print(f"⚠️  Already existing: {existing_count}")
    print(f"❌ Failed deployments: {failed_count}")
    print(f"📊 Total foreign keys active: {fk_count}")
    print(f"📄 Total tables deployed: {table_count}")
    
    # Calculate completion percentage
    estimated_total_fks = 105  # Original count from schema
    completion_pct = (fk_count / estimated_total_fks) * 100
    
    print(f"\n🎯 REFERENTIAL INTEGRITY COMPLETION: {completion_pct:.1f}%")
    
    if fk_count >= 90:
        print("🎉 EXCELLENT: Near-complete referential integrity achieved!")
        print("✅ Schema ready for production use with comprehensive data consistency")
    elif fk_count >= 75:
        print("🎉 SUCCESS: Substantial referential integrity established!")
        print("✅ Schema has strong data consistency enforcement")
    else:
        print("⚠️  PARTIAL: Basic referential integrity established")
        print("💡 Consider manual review of remaining foreign key requirements")
    
    connection.close()
    print("🔐 Database connection closed")

if __name__ == "__main__":
    main()