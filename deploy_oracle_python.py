#!/usr/bin/env python3
"""
Deploy Oracle USNDC Schema using Python oracledb
"""

import oracledb
import sys
import os
from datetime import datetime

# Oracle connection parameters
ORACLE_HOST = "usndc-oracle-db.c0320kayk04f.us-east-1.rds.amazonaws.com"
ORACLE_PORT = 1521
ORACLE_SID = "ORCL"
ORACLE_USER = "oracleadmin"
ORACLE_PASS = "OracleTest2024!"
SCHEMA_FILE = "usndc_oracle_schema_fixed.sql"

def connect_oracle():
    """Connect to Oracle database"""
    try:
        print("🔗 Connecting to Oracle database...")
        dsn = oracledb.makedsn(ORACLE_HOST, ORACLE_PORT, service_name=ORACLE_SID)
        connection = oracledb.connect(user=ORACLE_USER, password=ORACLE_PASS, dsn=dsn)
        print(f"✅ Connected to Oracle: {ORACLE_HOST}:{ORACLE_PORT}/{ORACLE_SID}")
        return connection
    except Exception as e:
        print(f"❌ Failed to connect to Oracle: {e}")
        return None

def test_connection(connection):
    """Test Oracle connection with simple query"""
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT 'Connection successful!' FROM DUAL")
        result = cursor.fetchone()
        print(f"✅ Connection test: {result[0]}")
        cursor.close()
        return True
    except Exception as e:
        print(f"❌ Connection test failed: {e}")
        return False

def deploy_schema(connection):
    """Deploy the Oracle schema from SQL file"""
    try:
        print(f"📋 Reading schema file: {SCHEMA_FILE}")
        
        if not os.path.exists(SCHEMA_FILE):
            print(f"❌ Schema file not found: {SCHEMA_FILE}")
            return False
        
        # Get file stats
        file_size = os.path.getsize(SCHEMA_FILE) / 1024
        with open(SCHEMA_FILE, 'r') as f:
            lines = sum(1 for line in f)
        
        print(f"📊 Schema file: {lines:,} lines, {file_size:.1f} KB")
        
        # Read and execute SQL
        with open(SCHEMA_FILE, 'r') as f:
            sql_content = f.read()
        
        # Split into statements (Oracle uses ; as statement delimiter)
        all_statements = [stmt.strip() for stmt in sql_content.split(';') if stmt.strip()]
        
        # Separate CREATE statements from COMMENT statements
        # Look for CREATE anywhere in the statement, not just at the beginning
        create_statements = []
        comment_statements = []
        
        for stmt in all_statements:
            stmt_upper = stmt.upper().strip()
            if 'CREATE TABLE' in stmt_upper:
                create_statements.append(stmt)
            elif stmt_upper.startswith('COMMENT'):
                comment_statements.append(stmt)
            elif stmt_upper.startswith('CREATE'):
                create_statements.append(stmt)  # Other CREATE statements
        
        print(f"🚀 Found {len(create_statements)} CREATE statements and {len(comment_statements)} COMMENT statements")
        
        cursor = connection.cursor()
        executed = 0
        errors = 0
        
        # First, execute all CREATE statements
        print("📋 Creating tables...")
        for i, statement in enumerate(create_statements, 1):
            try:
                cursor.execute(statement)
                executed += 1
                if i % 20 == 0:
                    print(f"   Created {i}/{len(create_statements)} tables...")
            except Exception as e:
                errors += 1
                print(f"   ⚠️  Error creating table {i}: {str(e)[:100]}")
                if errors > 50:  # Allow more errors for large schemas
                    print("❌ Too many errors, stopping deployment")
                    break
        
        # Then execute COMMENT statements
        if errors < 50:
            print("💬 Adding comments...")
            for i, statement in enumerate(comment_statements, 1):
                try:
                    cursor.execute(statement)
                    executed += 1
                except Exception as e:
                    # Comments are less critical, just count errors but don't stop
                    errors += 1
        
        connection.commit()
        cursor.close()
        
        print(f"✅ Schema deployment completed:")
        print(f"   - Executed: {executed} statements")
        print(f"   - Errors: {errors} statements")
        
        return errors < 10  # Consider successful if fewer than 10 errors
        
    except Exception as e:
        print(f"❌ Schema deployment failed: {e}")
        return False

def verify_tables(connection):
    """Verify table count and list tables"""
    try:
        cursor = connection.cursor()
        
        # Count tables
        cursor.execute("SELECT COUNT(*) FROM USER_TABLES")
        table_count = cursor.fetchone()[0]
        print(f"📊 Tables created: {table_count}")
        
        # List tables
        cursor.execute("SELECT TABLE_NAME FROM USER_TABLES ORDER BY TABLE_NAME")
        tables = cursor.fetchall()
        
        print(f"📋 Table list:")
        for i, (table_name,) in enumerate(tables[:10], 1):
            print(f"   {i:3d}. {table_name}")
        
        if len(tables) > 10:
            print(f"   ... and {len(tables) - 10} more tables")
        
        cursor.close()
        
        # Check if we got all 177 tables
        if table_count == 177:
            print("🎉 SUCCESS: All 177 tables created!")
        else:
            print(f"⚠️  Expected 177 tables, found {table_count}")
        
        return table_count
        
    except Exception as e:
        print(f"❌ Table verification failed: {e}")
        return 0

def verify_constraints(connection):
    """Verify constraints are created"""
    try:
        cursor = connection.cursor()
        
        # Count constraints
        cursor.execute("SELECT COUNT(*) FROM USER_CONSTRAINTS")
        constraint_count = cursor.fetchone()[0]
        print(f"🔗 Constraints created: {constraint_count}")
        
        # Count by constraint type
        cursor.execute("""
            SELECT CONSTRAINT_TYPE, COUNT(*) 
            FROM USER_CONSTRAINTS 
            GROUP BY CONSTRAINT_TYPE 
            ORDER BY CONSTRAINT_TYPE
        """)
        
        constraint_types = cursor.fetchall()
        for constraint_type, count in constraint_types:
            type_name = {
                'P': 'Primary Key',
                'C': 'Check',
                'R': 'Foreign Key',
                'U': 'Unique'
            }.get(constraint_type, constraint_type)
            print(f"   {type_name}: {count}")
        
        cursor.close()
        return constraint_count
        
    except Exception as e:
        print(f"❌ Constraint verification failed: {e}")
        return 0

def main():
    """Main deployment process"""
    print("🚀 USNDC Oracle Schema Deployment")
    print("=" * 50)
    print(f"📅 Started: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    # Connect to Oracle
    connection = connect_oracle()
    if not connection:
        sys.exit(1)
    
    try:
        # Test connection
        if not test_connection(connection):
            sys.exit(1)
        
        # Deploy schema
        if not deploy_schema(connection):
            print("❌ Schema deployment failed")
            sys.exit(1)
        
        # Verify deployment
        table_count = verify_tables(connection)
        constraint_count = verify_constraints(connection)
        
        print("\n" + "=" * 50)
        print("🎉 DEPLOYMENT SUMMARY")
        print(f"📊 Database: {ORACLE_HOST}:{ORACLE_PORT}/{ORACLE_SID}")
        print(f"👤 User: {ORACLE_USER}")
        print(f"📋 Tables: {table_count}")
        print(f"🔗 Constraints: {constraint_count}")
        print(f"📅 Completed: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        
        if table_count == 177:
            print("✅ SUCCESS: All 177 tables deployed!")
        else:
            print(f"⚠️  Partial deployment: {table_count}/177 tables")
    
    finally:
        connection.close()
        print("🔌 Database connection closed")

if __name__ == "__main__":
    main()