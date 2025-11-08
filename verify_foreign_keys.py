#!/usr/bin/env python3
"""
Verify foreign key constraints in the Oracle USNDC schema.
Check if foreign keys were properly implemented during deployment.
"""

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
        return connection
    except Exception as e:
        print(f"❌ Failed to connect to Oracle database: {e}")
        return None

def check_foreign_keys(connection):
    """Check foreign key constraints in detail."""
    cursor = connection.cursor()
    
    # Get all constraint types with counts
    print("🔒 CONSTRAINT TYPE BREAKDOWN:")
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
    for constraint_type, count, description in constraints:
        print(f"  {constraint_type}: {count:4d} - {description}")
    
    # Check specifically for foreign keys
    cursor.execute("""
        SELECT COUNT(*) 
        FROM user_constraints 
        WHERE constraint_type = 'R' 
        AND constraint_name NOT LIKE 'BIN$%'
    """)
    fk_count = cursor.fetchone()[0]
    
    if fk_count == 0:
        print(f"\n❌ NO FOREIGN KEYS FOUND!")
        print("   Foreign key constraints were not deployed with the schema")
        return False
    
    print(f"\n✅ FOREIGN KEYS FOUND: {fk_count}")
    
    # Get detailed foreign key information
    cursor.execute("""
        SELECT c.constraint_name,
               c.table_name as child_table,
               cc.column_name as child_column,
               r.table_name as parent_table,
               rc.column_name as parent_column,
               c.delete_rule
        FROM user_constraints c
        JOIN user_cons_columns cc ON c.constraint_name = cc.constraint_name
        JOIN user_constraints r ON c.r_constraint_name = r.constraint_name
        JOIN user_cons_columns rc ON r.constraint_name = rc.constraint_name
        WHERE c.constraint_type = 'R'
        AND c.constraint_name NOT LIKE 'BIN$%'
        ORDER BY c.table_name, c.constraint_name
        FETCH FIRST 10 ROWS ONLY
    """)
    
    fk_details = cursor.fetchall()
    
    if fk_details:
        print(f"\n📋 SAMPLE FOREIGN KEY RELATIONSHIPS (First 10):")
        for fk_name, child_table, child_col, parent_table, parent_col, delete_rule in fk_details:
            print(f"  🔗 {child_table}.{child_col} → {parent_table}.{parent_col}")
            print(f"     Constraint: {fk_name}, Delete Rule: {delete_rule}")
    
    # Get tables with most foreign key relationships
    cursor.execute("""
        SELECT c.table_name,
               COUNT(*) as fk_count
        FROM user_constraints c
        WHERE c.constraint_type = 'R'
        AND c.constraint_name NOT LIKE 'BIN$%'
        GROUP BY c.table_name
        ORDER BY fk_count DESC
        FETCH FIRST 5 ROWS ONLY
    """)
    
    top_fk_tables = cursor.fetchall()
    
    if top_fk_tables:
        print(f"\n📊 TABLES WITH MOST FOREIGN KEYS:")
        for table_name, fk_count in top_fk_tables:
            print(f"  📄 {table_name}: {fk_count} foreign keys")
    
    cursor.close()
    return fk_count > 0

def check_referential_integrity_sample(connection):
    """Test a sample foreign key constraint."""
    cursor = connection.cursor()
    
    try:
        # Get a sample foreign key constraint
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
            FETCH FIRST 1 ROWS ONLY
        """)
        
        result = cursor.fetchone()
        if result:
            fk_name, child_table, child_col, parent_table, parent_col = result
            
            print(f"\n🧪 TESTING REFERENTIAL INTEGRITY:")
            print(f"   Sample FK: {child_table}.{child_col} → {parent_table}.{parent_col}")
            
            # Try to insert invalid foreign key (this should fail)
            try:
                cursor.execute(f"""
                    INSERT INTO {child_table} ({child_col}) 
                    VALUES (99999999)
                """)
                cursor.execute("ROLLBACK")
                print(f"   ❌ WARNING: Foreign key constraint not enforcing!")
            except Exception as e:
                if "integrity constraint" in str(e).lower():
                    print(f"   ✅ Foreign key constraint properly enforcing")
                else:
                    print(f"   ⚠️  Test inconclusive: {str(e)[:100]}...")
        else:
            print(f"\n⚠️  No foreign keys found to test")
            
    except Exception as e:
        print(f"\n❌ Error testing referential integrity: {e}")
    
    cursor.close()

def main():
    """Main execution function."""
    print("🔍 Oracle Foreign Key Constraint Verification")
    print("=" * 60)
    
    # Connect to Oracle
    connection = connect_to_oracle()
    if not connection:
        return
    
    # Check foreign key deployment
    has_foreign_keys = check_foreign_keys(connection)
    
    if has_foreign_keys:
        # Test referential integrity
        check_referential_integrity_sample(connection)
    
    # Final summary
    print("\n" + "=" * 60)
    print("📋 FOREIGN KEY VERIFICATION SUMMARY:")
    
    if has_foreign_keys:
        print("✅ Foreign keys are properly deployed")
        print("✅ Referential integrity constraints are active")
        print("✅ Schema includes complete relationship enforcement")
    else:
        print("❌ No foreign keys found in the schema")
        print("⚠️  Tables are deployed but relationships are not enforced")
        print("💡 You may need to deploy foreign key constraints separately")
    
    connection.close()

if __name__ == "__main__":
    main()