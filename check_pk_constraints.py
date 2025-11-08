#!/usr/bin/env python3
"""
Check primary key and unique constraints on parent tables.
Foreign keys require referenced columns to have primary/unique constraints.
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
        print(f"❌ Failed to connect: {e}")
        return None

def check_primary_keys(connection):
    """Check primary key constraints on key parent tables."""
    cursor = connection.cursor()
    
    # Check primary keys on tables that should be referenced
    parent_tables = ['ARRIVAL', 'AMPLITUDE', 'ORIGIN', 'EVENT', 'WFDISC']
    
    print("🔍 Checking Primary Key Constraints on Parent Tables...")
    
    for table in parent_tables:
        cursor.execute("""
            SELECT c.constraint_name, cc.column_name
            FROM user_constraints c
            JOIN user_cons_columns cc ON c.constraint_name = cc.constraint_name
            WHERE c.table_name = :table_name 
            AND c.constraint_type = 'P'
            ORDER BY cc.position
        """, table_name=table.upper())
        
        pk_columns = cursor.fetchall()
        
        if pk_columns:
            pk_cols = [col[1] for col in pk_columns]
            pk_name = pk_columns[0][0]
            print(f"✅ {table}: PK '{pk_name}' on columns: {', '.join(pk_cols)}")
        else:
            print(f"❌ {table}: NO PRIMARY KEY FOUND!")
            
            # Check if there are unique constraints instead
            cursor.execute("""
                SELECT c.constraint_name, cc.column_name
                FROM user_constraints c
                JOIN user_cons_columns cc ON c.constraint_name = cc.constraint_name
                WHERE c.table_name = :table_name 
                AND c.constraint_type = 'U'
                ORDER BY cc.position
            """, table_name=table.upper())
            
            unique_constraints = cursor.fetchall()
            if unique_constraints:
                for constraint_name, column_name in unique_constraints:
                    print(f"   ⚠️  Has UNIQUE constraint '{constraint_name}' on '{column_name}'")
    
    cursor.close()

def check_specific_fk_requirements(connection):
    """Check specific requirements for the first few foreign keys."""
    cursor = connection.cursor()
    
    print("\n🔍 Checking Specific FK Requirements...")
    
    # Test cases from our failing foreign keys
    test_cases = [
        ('AMP3C', 'ARID', 'ARRIVAL', 'ARID'),
        ('AMPLITUDE', 'ARID', 'ARRIVAL', 'ARID'),
        ('AMPLITUDE_DYN_PARS_DBL', 'AMPID', 'AMPLITUDE', 'AMPID'),
    ]
    
    for child_table, child_col, parent_table, parent_col in test_cases:
        print(f"\n📋 Checking: {child_table}.{child_col} → {parent_table}.{parent_col}")
        
        # Check if parent column has primary key or unique constraint
        cursor.execute("""
            SELECT c.constraint_type, c.constraint_name
            FROM user_constraints c
            JOIN user_cons_columns cc ON c.constraint_name = cc.constraint_name
            WHERE c.table_name = :table_name 
            AND cc.column_name = :column_name
            AND c.constraint_type IN ('P', 'U')
        """, table_name=parent_table.upper(), column_name=parent_col.upper())
        
        parent_constraints = cursor.fetchall()
        
        if parent_constraints:
            for constraint_type, constraint_name in parent_constraints:
                constraint_desc = 'PRIMARY KEY' if constraint_type == 'P' else 'UNIQUE'
                print(f"   ✅ Parent column has {constraint_desc}: {constraint_name}")
        else:
            print(f"   ❌ Parent column '{parent_col}' has NO primary key or unique constraint!")
        
        # Check data types match
        cursor.execute("""
            SELECT data_type, data_length, data_precision, data_scale, nullable
            FROM user_tab_columns
            WHERE table_name = :table_name AND column_name = :column_name
        """, table_name=child_table.upper(), column_name=child_col.upper())
        
        child_info = cursor.fetchone()
        
        cursor.execute("""
            SELECT data_type, data_length, data_precision, data_scale, nullable
            FROM user_tab_columns
            WHERE table_name = :table_name AND column_name = :column_name
        """, table_name=parent_table.upper(), column_name=parent_col.upper())
        
        parent_info = cursor.fetchone()
        
        if child_info and parent_info:
            if child_info[:4] == parent_info[:4]:  # Compare data type info
                print(f"   ✅ Data types match: {child_info[0]}")
            else:
                print(f"   ❌ Data types don't match!")
                print(f"      Child:  {child_info}")
                print(f"      Parent: {parent_info}")
        
        # Try creating the foreign key manually with detailed error handling
        try:
            fk_name = f"TEST_FK_{child_table}_{child_col}"
            sql = f"ALTER TABLE {child_table} ADD CONSTRAINT {fk_name} FOREIGN KEY ({child_col}) REFERENCES {parent_table} ({parent_col})"
            print(f"   🧪 Testing: {sql[:60]}...")
            
            cursor.execute(sql)
            connection.commit()
            print(f"   🎉 SUCCESS! Foreign key created.")
            
            # Clean up
            cursor.execute(f"ALTER TABLE {child_table} DROP CONSTRAINT {fk_name}")
            connection.commit()
            print(f"   🧹 Cleaned up test constraint")
            
        except Exception as e:
            print(f"   ❌ Failed: {e}")
    
    cursor.close()

def main():
    connection = connect_to_oracle()
    if not connection:
        return
    
    check_primary_keys(connection)
    check_specific_fk_requirements(connection)
    
    connection.close()

if __name__ == "__main__":
    main()