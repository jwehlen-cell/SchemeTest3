#!/usr/bin/env python3
"""
Fix and deploy Oracle foreign key constraints for USNDC schema.
This script cleans up syntax issues and creates proper foreign key relationships.
"""

import oracledb
import sys
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
        print("✅ Connected to Oracle database successfully")
        return connection
    except Exception as e:
        print(f"❌ Failed to connect to Oracle database: {e}")
        return None

def fix_foreign_key_syntax():
    """Fix syntax issues in foreign key constraints."""
    print("🔧 Fixing foreign key syntax issues...")
    
    # Read the original broken foreign keys
    with open('oracle_foreign_keys.sql', 'r') as f:
        lines = f.readlines()
    
    fixed_fks = []
    constraint_counter = 1
    
    for i, line in enumerate(lines):
        line = line.strip()
        if not line:
            continue
            
        # Fix broken column names with spaces
        line = re.sub(r'CLUSTAI D', 'CLUSTAID', line)
        line = re.sub(r'ACTIV ETIME', 'ACTIVETIME', line)
        line = re.sub(r'ACTIVETI ME', 'ACTIVETIME', line)
        line = re.sub(r'ACTIVET IME', 'ACTIVETIME', line)
        line = re.sub(r'ACT IVETIME', 'ACTIVETIME', line)
        line = re.sub(r'CLUST AID', 'CLUSTAID', line)
        line = re.sub(r'SOURCE_ORI D', 'SOURCE_ORID', line)
        line = re.sub(r'OBSTYPE_I D', 'OBSTYPE_ID', line)
        line = re.sub(r'VALUE_I D', 'VALUE_ID', line)
        
        # Fix missing constraint names
        if 'ADD CONSTRAINT  FOREIGN KEY' in line:
            # Extract table name
            table_match = re.search(r'ALTER TABLE (\w+)', line)
            if table_match:
                table_name = table_match.group(1)
                constraint_name = f"{table_name}_FK_{constraint_counter:03d}"
                line = line.replace('ADD CONSTRAINT  FOREIGN KEY', f'ADD CONSTRAINT {constraint_name} FOREIGN KEY')
                constraint_counter += 1
        
        # Fix other syntax issues
        line = re.sub(r'--.*$', '', line)  # Remove comments
        line = line.strip()
        
        if line and 'ALTER TABLE' in line and 'FOREIGN KEY' in line:
            fixed_fks.append(line)
    
    # Write fixed foreign keys to new file
    with open('oracle_foreign_keys_fixed.sql', 'w') as f:
        for fk in fixed_fks:
            f.write(fk + '\n')
    
    print(f"✅ Fixed {len(fixed_fks)} foreign key constraints")
    return fixed_fks

def validate_tables_exist(connection, foreign_keys):
    """Check if referenced tables exist before creating foreign keys."""
    cursor = connection.cursor()
    
    # Get all existing tables
    cursor.execute("SELECT table_name FROM user_tables WHERE table_name NOT LIKE 'BIN$%'")
    existing_tables = {row[0].upper() for row in cursor.fetchall()}
    
    valid_fks = []
    invalid_fks = []
    
    for fk in foreign_keys:
        # Extract table names from foreign key statement
        table_match = re.search(r'ALTER TABLE (\w+)', fk)
        ref_match = re.search(r'REFERENCES (\w+)', fk)
        
        if table_match and ref_match:
            child_table = table_match.group(1).upper()
            parent_table = ref_match.group(1).upper()
            
            if child_table in existing_tables and parent_table in existing_tables:
                valid_fks.append(fk)
            else:
                invalid_fks.append((fk, child_table, parent_table))
                if child_table not in existing_tables:
                    print(f"⚠️  Missing child table: {child_table}")
                if parent_table not in existing_tables:
                    print(f"⚠️  Missing parent table: {parent_table}")
    
    cursor.close()
    
    print(f"✅ Valid foreign keys: {len(valid_fks)}")
    print(f"❌ Invalid foreign keys (missing tables): {len(invalid_fks)}")
    
    return valid_fks, invalid_fks

def deploy_foreign_keys(connection, foreign_keys):
    """Deploy the fixed foreign key constraints."""
    cursor = connection.cursor()
    success_count = 0
    failed_constraints = []
    
    print(f"\n🔗 Deploying {len(foreign_keys)} foreign key constraints...")
    
    for i, fk_statement in enumerate(foreign_keys, 1):
        try:
            cursor.execute(fk_statement)
            connection.commit()
            
            # Extract constraint info for success message
            table_match = re.search(r'ALTER TABLE (\w+)', fk_statement)
            constraint_match = re.search(r'ADD CONSTRAINT (\w+)', fk_statement)
            
            table_name = table_match.group(1) if table_match else "Unknown"
            constraint_name = constraint_match.group(1) if constraint_match else "Unknown"
            
            print(f"✅ FK {i:3d}: {constraint_name} on {table_name}")
            success_count += 1
                
        except Exception as e:
            error_msg = str(e)
            
            # Skip if constraint already exists
            if "already exists" in error_msg.lower() or "ora-00955" in error_msg.lower():
                print(f"⚠️  FK {i:3d}: Constraint already exists - skipping")
                success_count += 1
                continue
                
            failed_constraints.append((i, fk_statement[:100] + "...", error_msg))
            
            # Extract constraint info for error message  
            table_match = re.search(r'ALTER TABLE (\w+)', fk_statement)
            constraint_match = re.search(r'ADD CONSTRAINT (\w+)', fk_statement)
            
            table_name = table_match.group(1) if table_match else "Unknown"
            constraint_name = constraint_match.group(1) if constraint_match else "Unknown"
            
            print(f"❌ FK {i:3d}: {constraint_name} on {table_name} - {error_msg}")
    
    cursor.close()
    return success_count, failed_constraints

def verify_final_state(connection):
    """Verify the final state of foreign key deployment."""
    cursor = connection.cursor()
    
    # Get constraint counts
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
        FETCH FIRST 8 ROWS ONLY
    """)
    
    sample_fks = cursor.fetchall()
    cursor.close()
    
    return constraints, sample_fks

def main():
    """Main execution function."""
    print("🚀 Fixing and Deploying Oracle Foreign Key Constraints...")
    print("=" * 70)
    
    # Fix foreign key syntax
    fixed_fks = fix_foreign_key_syntax()
    
    # Connect to Oracle
    connection = connect_to_oracle()
    if not connection:
        sys.exit(1)
    
    # Validate tables exist
    valid_fks, invalid_fks = validate_tables_exist(connection, fixed_fks)
    
    if not valid_fks:
        print("❌ No valid foreign keys found to deploy")
        connection.close()
        return
    
    # Deploy valid foreign keys
    success_count, failed_constraints = deploy_foreign_keys(connection, valid_fks)
    
    # Verify final state
    constraints, sample_fks = verify_final_state(connection)
    
    # Display constraint summary
    print(f"\n🔒 FINAL CONSTRAINT SUMMARY:")
    total_constraints = 0
    fk_count = 0
    
    for constraint_type, count, description in constraints:
        print(f"  {constraint_type}: {count:4d} - {description}")
        total_constraints += count
        if constraint_type == 'R':
            fk_count = count
    
    print(f"  Total: {total_constraints} constraints")
    
    # Show sample relationships
    if sample_fks:
        print(f"\n🔗 SAMPLE FOREIGN KEY RELATIONSHIPS:")
        for fk_name, child_table, child_col, parent_table, parent_col in sample_fks:
            print(f"  📄 {child_table}.{child_col} → {parent_table}.{parent_col}")
    
    # Final summary
    print("\n" + "=" * 70)
    print("📋 FOREIGN KEY DEPLOYMENT SUMMARY:")
    print(f"✅ Successfully deployed: {success_count} foreign keys")
    print(f"📊 Total foreign keys active: {fk_count}")
    print(f"❌ Failed deployments: {len(failed_constraints)}")
    print(f"⚠️  Skipped (missing tables): {len(invalid_fks)}")
    
    if fk_count > 50:
        print("🎉 SUCCESS: Substantial referential integrity established!")
        print("✅ Foreign key constraints enforce data consistency")
        print("✅ Schema now has relationship enforcement")
    elif fk_count > 0:
        print(f"⚠️  Partial success: {fk_count} foreign keys deployed")
        print("💡 Some foreign keys may need manual review")
    else:
        print("❌ No foreign keys successfully deployed")
        print("💡 Check table names and column compatibility")
    
    connection.close()
    print("🔐 Database connection closed")

if __name__ == "__main__":
    main()