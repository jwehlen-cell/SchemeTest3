#!/usr/bin/env python3
"""
Test different Oracle foreign key syntax approaches.
Research the correct way to add foreign keys in Oracle.
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

def test_fk_syntax(connection):
    """Test different foreign key syntax approaches."""
    cursor = connection.cursor()
    
    print("🧪 Testing Oracle Foreign Key Syntax...")
    
    # First, create test tables
    try:
        cursor.execute("""
            CREATE TABLE test_parent (
                id NUMBER(18) PRIMARY KEY,
                name VARCHAR2(50)
            )
        """)
        print("✅ Created test_parent table")
    except Exception as e:
        if "already exists" in str(e):
            print("⚠️  test_parent already exists")
        else:
            print(f"❌ Error creating test_parent: {e}")
    
    try:
        cursor.execute("""
            CREATE TABLE test_child (
                id NUMBER(18) PRIMARY KEY,
                parent_id NUMBER(18),
                name VARCHAR2(50)
            )
        """)
        print("✅ Created test_child table")
    except Exception as e:
        if "already exists" in str(e):
            print("⚠️  test_child already exists")
        else:
            print(f"❌ Error creating test_child: {e}")
    
    connection.commit()
    
    # Test different foreign key syntax approaches
    test_cases = [
        # Syntax 1: Standard ALTER TABLE approach
        "ALTER TABLE test_child ADD CONSTRAINT test_fk1 FOREIGN KEY (parent_id) REFERENCES test_parent (id)",
        
        # Syntax 2: Without parentheses around constraint
        "ALTER TABLE test_child ADD CONSTRAINT test_fk2 FOREIGN KEY (parent_id) REFERENCES test_parent(id)",
        
        # Syntax 3: With explicit column specification
        "ALTER TABLE test_child ADD (CONSTRAINT test_fk3 FOREIGN KEY (parent_id) REFERENCES test_parent (id))",
    ]
    
    for i, sql in enumerate(test_cases, 1):
        try:
            print(f"\n🧪 Testing syntax {i}: {sql[:60]}...")
            cursor.execute(sql)
            connection.commit()
            print(f"✅ Syntax {i} SUCCESS!")
            
            # If successful, verify the constraint exists
            cursor.execute("""
                SELECT constraint_name, constraint_type 
                FROM user_constraints 
                WHERE constraint_name LIKE 'TEST_FK%'
                ORDER BY constraint_name
            """)
            results = cursor.fetchall()
            print(f"   Found constraints: {results}")
            
            break  # Use the first working syntax
            
        except Exception as e:
            print(f"❌ Syntax {i} failed: {e}")
    
    # Clean up test tables
    try:
        cursor.execute("DROP TABLE test_child")
        cursor.execute("DROP TABLE test_parent")
        connection.commit()
        print("🧹 Cleaned up test tables")
    except Exception as e:
        print(f"⚠️  Cleanup warning: {e}")
    
    cursor.close()

def check_existing_constraints(connection):
    """Check what constraint types already exist."""
    cursor = connection.cursor()
    
    cursor.execute("""
        SELECT constraint_type, COUNT(*) as count
        FROM user_constraints
        WHERE constraint_name NOT LIKE 'BIN$%'
        GROUP BY constraint_type
        ORDER BY constraint_type
    """)
    
    constraints = cursor.fetchall()
    print("\n📊 Current Constraints:")
    for constraint_type, count in constraints:
        type_name = {
            'P': 'Primary Key',
            'R': 'Foreign Key', 
            'C': 'Check',
            'U': 'Unique'
        }.get(constraint_type, f'Type {constraint_type}')
        print(f"  {constraint_type}: {count:4d} - {type_name}")
    
    cursor.close()

def main():
    connection = connect_to_oracle()
    if not connection:
        return
    
    check_existing_constraints(connection)
    test_fk_syntax(connection)
    check_existing_constraints(connection)
    
    connection.close()

if __name__ == "__main__":
    main()