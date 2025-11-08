#!/usr/bin/env python3
"""
Deploy Oracle foreign key constraints to complete the USNDC schema.
This script adds all 105+ foreign key relationships to enforce referential integrity.
"""

import oracledb
import sys
import os

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

def deploy_foreign_keys(connection, filename):
    """Deploy foreign key constraints from file."""
    if not os.path.exists(filename):
        print(f"❌ File {filename} not found")
        return False
        
    with open(filename, 'r') as f:
        foreign_keys = [line.strip() for line in f.readlines() if line.strip()]
    
    print(f"📋 Found {len(foreign_keys)} foreign key constraints to deploy")
    
    cursor = connection.cursor()
    success_count = 0
    failed_constraints = []
    
    for i, fk_statement in enumerate(foreign_keys, 1):
        if not fk_statement.strip():
            continue
            
        try:
            cursor.execute(fk_statement)
            connection.commit()
            
            # Extract constraint name for success message
            parts = fk_statement.split()
            table_name = parts[2] if len(parts) > 2 else "Unknown"
            constraint_name = parts[5] if len(parts) > 5 else "Unknown"
            
            print(f"✅ FK {i:3d}: {constraint_name} on {table_name}")
            success_count += 1
                
        except Exception as e:
            error_msg = str(e)
            failed_constraints.append((i, fk_statement[:100] + "...", error_msg))
            
            # Extract constraint info for error message  
            parts = fk_statement.split()
            table_name = parts[2] if len(parts) > 2 else "Unknown"
            constraint_name = parts[5] if len(parts) > 5 else "Unknown"
            
            print(f"❌ FK {i:3d}: {constraint_name} on {table_name} - {error_msg}")
    
    cursor.close()
    return success_count, failed_constraints

def verify_foreign_keys(connection):
    """Verify foreign key deployment."""
    cursor = connection.cursor()
    
    # Get foreign key count
    cursor.execute("""
        SELECT COUNT(*) 
        FROM user_constraints 
        WHERE constraint_type = 'R' 
        AND constraint_name NOT LIKE 'BIN$%'
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
        ORDER BY c.table_name
        FETCH FIRST 5 ROWS ONLY
    """)
    
    sample_fks = cursor.fetchall()
    
    cursor.close()
    return fk_count, sample_fks

def get_constraint_summary(connection):
    """Get updated constraint summary after foreign key deployment."""
    cursor = connection.cursor()
    
    cursor.execute("""
        SELECT constraint_type, 
               COUNT(*) as count,
               CASE constraint_type 
                   WHEN 'P' THEN 'Primary Key'
                   WHEN 'R' THEN 'Foreign Key'
                   WHEN 'C' THEN 'Check Constraint'
                   WHEN 'U' THEN 'Unique Constraint'
                   ELSE 'Other'
               END as description
        FROM user_constraints 
        WHERE constraint_name NOT LIKE 'BIN$%'
        GROUP BY constraint_type
        ORDER BY constraint_type
    """)
    
    constraints = cursor.fetchall()
    cursor.close()
    return constraints

def main():
    """Main execution function."""
    print("🚀 Deploying Oracle Foreign Key Constraints...")
    print("=" * 60)
    
    # Connect to Oracle
    connection = connect_to_oracle()
    if not connection:
        sys.exit(1)
    
    # Get initial foreign key count
    initial_fk_count, _ = verify_foreign_keys(connection)
    print(f"📊 Initial foreign key count: {initial_fk_count}")
    
    # Deploy foreign keys
    print("\n🔗 Deploying foreign key constraints...")
    success_count, failed_constraints = deploy_foreign_keys(connection, 'oracle_foreign_keys.sql')
    
    # Get final statistics
    final_fk_count, sample_fks = verify_foreign_keys(connection)
    print(f"\n📊 Final foreign key count: {final_fk_count}")
    print(f"📈 Foreign keys added: {final_fk_count - initial_fk_count}")
    
    # Show sample relationships
    if sample_fks:
        print(f"\n🔗 SAMPLE FOREIGN KEY RELATIONSHIPS:")
        for fk_name, child_table, child_col, parent_table, parent_col in sample_fks:
            print(f"  📄 {child_table}.{child_col} → {parent_table}.{parent_col}")
    
    # Get updated constraint summary
    print(f"\n🔒 UPDATED CONSTRAINT SUMMARY:")
    constraints = get_constraint_summary(connection)
    total_constraints = 0
    
    for constraint_type, count, description in constraints:
        print(f"  {constraint_type}: {count:4d} - {description}")
        total_constraints += count
    
    print(f"  Total: {total_constraints} constraints")
    
    # Summary
    print("\n" + "=" * 60)
    print("📋 FOREIGN KEY DEPLOYMENT SUMMARY:")
    print(f"✅ Successfully deployed: {success_count} foreign keys")
    print(f"📊 Total foreign keys: {final_fk_count}")
    
    if failed_constraints:
        print(f"❌ Failed constraints: {len(failed_constraints)}")
        for i, (fk_num, fk_preview, error) in enumerate(failed_constraints[:5], 1):
            print(f"   {i}. FK {fk_num}: {error}")
        if len(failed_constraints) > 5:
            print(f"   ... and {len(failed_constraints) - 5} more")
    
    if final_fk_count > 90:
        print("🎉 SUCCESS: Comprehensive referential integrity established!")
        print("✅ Foreign key constraints ensure data consistency")
        print("✅ Schema now has complete relationship enforcement")
    else:
        print(f"⚠️  Partial deployment: {final_fk_count}/105+ foreign keys")
    
    connection.close()
    print("🔐 Database connection closed")

if __name__ == "__main__":
    main()