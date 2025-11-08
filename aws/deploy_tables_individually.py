#!/usr/bin/env python3

import psycopg2
import re
import sys

def deploy_complete_schema():
    """Deploy all 177 tables from the USNDC schema one by one."""
    
    # Database connection details
    conn_params = {
        'host': 'usndc-schema-usndc-schematest3-clone.c0320kayk04f.us-east-1.rds.amazonaws.com',
        'port': 5432,
        'database': 'usndc_schema',
        'user': 'schemaadmin',
        'password': 'SchemaTest2024!'
    }
    
    print("🔗 Connecting to database...")
    try:
        conn = psycopg2.connect(**conn_params)
        cur = conn.cursor()
        conn.autocommit = True
        print("✅ Connected successfully")
    except Exception as e:
        print(f"❌ Connection failed: {e}")
        return False
    
    # Read schema file
    print("📖 Reading schema file...")
    with open('usndc_schema.sql', 'r') as f:
        content = f.read()
    
    # Extract CREATE TABLE statements
    create_table_pattern = r'CREATE TABLE\s+(\w+)\s*\((.*?)\);'
    tables = re.findall(create_table_pattern, content, re.DOTALL | re.IGNORECASE)
    
    print(f"🔍 Found {len(tables)} CREATE TABLE statements")
    
    success_count = 0
    skip_count = 0
    error_count = 0
    
    for i, (table_name, table_body) in enumerate(tables):
        try:
            # Check if table already exists
            cur.execute("""
                SELECT EXISTS (
                    SELECT FROM information_schema.tables 
                    WHERE table_schema = 'public' 
                    AND table_name = %s
                );
            """, (table_name.lower(),))
            
            if cur.fetchone()[0]:
                print(f"⏭️  {i+1:3d}/177: {table_name} (already exists)")
                skip_count += 1
                continue
            
            # Clean the CREATE TABLE statement
            create_sql = f"CREATE TABLE {table_name} ({table_body});"
            
            # Remove comments and fix formatting issues
            lines = create_sql.split('\n')
            cleaned_lines = []
            for line in lines:
                if '--' in line:
                    line = line.split('--')[0].strip()
                if line:
                    cleaned_lines.append(line)
            
            cleaned_sql = '\n'.join(cleaned_lines)
            
            # Execute CREATE TABLE
            cur.execute(cleaned_sql)
            print(f"✅ {i+1:3d}/177: {table_name}")
            success_count += 1
            
        except Exception as e:
            print(f"❌ {i+1:3d}/177: {table_name} - {str(e)[:100]}")
            error_count += 1
    
    # Final count
    cur.execute("""
        SELECT COUNT(*) FROM information_schema.tables 
        WHERE table_schema = 'public' AND table_type = 'BASE TABLE';
    """)
    final_count = cur.fetchone()[0]
    
    print("")
    print("📊 Deployment Summary:")
    print(f"   ✅ Successfully created: {success_count} tables")
    print(f"   ⏭️  Already existed: {skip_count} tables")
    print(f"   ❌ Failed to create: {error_count} tables")
    print(f"   📋 Total tables in database: {final_count}")
    print("")
    
    if final_count > 100:
        print("🎉 Successfully deployed complete USNDC schema!")
        return True
    else:
        print(f"⚠️  Only {final_count} tables deployed (expected 177+)")
        return False
    
    conn.close()

if __name__ == "__main__":
    print("🚀 Deploying Complete USNDC Schema (177 tables)...")
    success = deploy_complete_schema()
    sys.exit(0 if success else 1)