#!/usr/bin/env python3
"""
Analyze and fix the remaining 27 failed foreign key constraints.
Identify specific issues and create corrected versions.
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

def analyze_failed_fks():
    """Analyze the failed foreign key statements from the original file."""
    print("🔍 Analyzing Failed Foreign Key Constraints...")
    
    # Read the original foreign keys
    with open('oracle_foreign_keys_fixed.sql', 'r') as f:
        lines = f.readlines()
    
    failed_fks = []
    parse_errors = []
    missing_keys = []
    
    # Identify the problematic ones based on our previous run
    problematic_patterns = [
        # Parse errors (missing constraint names, broken syntax)
        r'ALTER TABLE.*ADD CONSTRAINT\s+FOREIGN KEY',  # Missing constraint name
        r'ALTER TABLE.*REFERENCES.*\s\w+\s\w+\)',      # Broken references
        
        # Known missing parent key issues
        'CLUSTER_MAGREF.*CLUSTAID.*CLUSTER_STATION.*CLUSTAID',
        'CLUSTER_MEC.*CLUSTAID.*CLUSTER_STATION.*CLUSTAID', 
        'CLUSTER_ORID.*CLUSTAID.*CLUSTER_STATION.*CLUSTAID',
        'CLUSTER_OVERRIDE.*CLUSTAID.*CLUSTER_STATION.*CLUSTAID',
        'CODAMAG_OUTPUT.*FLO.*CODAMAG_INPUT.*FLO',
        'CODAMAG_OUTPUT.*FHI.*CODAMAG_INPUT.*FHI',
        'EVENT_CORRELATION.*SOURCE_EVID.*EVENT.*SOURCE_EVID',
        'EVENT_CORRELATION.*SOURCE_ORID.*ORIGIN.*SOURCE_ORID',
        'MDAC_FD.*CORRID.*MDAC_FI.*CORRID',
        'SVDDISC.*CLUSTAID.*CLUSTER_STATION.*CLUSTAID'
    ]
    
    for i, line in enumerate(lines, 1):
        line = line.strip()
        if not line or line.startswith('--'):
            continue
            
        # Check for parse errors
        if 'ADD CONSTRAINT  FOREIGN KEY' in line:
            parse_errors.append((i, line, "Missing constraint name"))
        elif re.search(r'REFERENCES.*\s\w+\s\w+\)', line):
            parse_errors.append((i, line, "Broken reference syntax"))
        
        # Check for known missing key issues
        for pattern in problematic_patterns[2:]:  # Skip parse error patterns
            if re.search(pattern, line, re.IGNORECASE):
                missing_keys.append((i, line, f"Missing parent key: {pattern}"))
    
    return parse_errors, missing_keys

def check_missing_parent_keys(connection):
    """Check which parent tables are missing required primary/unique keys."""
    cursor = connection.cursor()
    
    print("\n🔍 Checking Missing Parent Key Constraints...")
    
    # Check specific tables that are causing foreign key failures
    problem_tables = [
        ('CLUSTER_STATION', 'CLUSTAID'),
        ('CLUSTER_STATION', 'ACTIVETIME'), 
        ('CODAMAG_INPUT', 'FLO'),
        ('CODAMAG_INPUT', 'FHI'),
        ('EVENT', 'SOURCE_EVID'),
        ('ORIGIN', 'SOURCE_ORID'),
        ('MDAC_FI', 'CORRID'),
    ]
    
    for table_name, column_name in problem_tables:
        print(f"\n📋 Checking {table_name}.{column_name}:")
        
        # Check if table exists
        cursor.execute("""
            SELECT COUNT(*) FROM user_tables 
            WHERE table_name = :table_name
        """, table_name=table_name.upper())
        
        table_exists = cursor.fetchone()[0] > 0
        
        if not table_exists:
            print(f"   ❌ Table {table_name} does not exist")
            continue
        
        # Check if column exists
        cursor.execute("""
            SELECT data_type, nullable FROM user_tab_columns 
            WHERE table_name = :table_name AND column_name = :column_name
        """, table_name=table_name.upper(), column_name=column_name.upper())
        
        column_info = cursor.fetchone()
        
        if not column_info:
            print(f"   ❌ Column {column_name} does not exist in {table_name}")
            continue
            
        print(f"   ✅ Column exists: {column_info[0]} {column_info[1]}")
        
        # Check for existing primary key or unique constraint on this column
        cursor.execute("""
            SELECT c.constraint_type, c.constraint_name
            FROM user_constraints c
            JOIN user_cons_columns cc ON c.constraint_name = cc.constraint_name
            WHERE c.table_name = :table_name 
            AND cc.column_name = :column_name
            AND c.constraint_type IN ('P', 'U')
        """, table_name=table_name.upper(), column_name=column_name.upper())
        
        constraints = cursor.fetchall()
        
        if constraints:
            for constraint_type, constraint_name in constraints:
                constraint_desc = 'PRIMARY KEY' if constraint_type == 'P' else 'UNIQUE'
                print(f"   ✅ Has {constraint_desc}: {constraint_name}")
        else:
            print(f"   ❌ Missing primary key or unique constraint on {column_name}")
            
            # Suggest solution
            print(f"   💡 Need: ALTER TABLE {table_name} ADD CONSTRAINT {table_name}_{column_name}_UK UNIQUE ({column_name})")
    
    cursor.close()

def create_missing_constraints(connection):
    """Create missing unique constraints for parent tables."""
    cursor = connection.cursor()
    
    print("\n🔧 Creating Missing Parent Key Constraints...")
    
    # Define the missing constraints needed
    missing_constraints = [
        ("CLUSTER_STATION", "CLUSTAID", "CLUSTAID_ACTIVETIME_UK", "(CLUSTAID, ACTIVETIME)"),
        ("CODAMAG_INPUT", "AMPID_FLO_FHI", "CODAMAG_INPUT_COMPOSITE_UK", "(AMPID, FLO, FHI)"),
    ]
    
    success_count = 0
    
    for table_name, description, constraint_name, columns in missing_constraints:
        try:
            sql = f"ALTER TABLE {table_name} ADD CONSTRAINT {constraint_name} UNIQUE {columns}"
            print(f"   🔧 Creating: {constraint_name} on {table_name}")
            print(f"      SQL: {sql}")
            
            cursor.execute(sql)
            connection.commit()
            print(f"   ✅ Successfully created {constraint_name}")
            success_count += 1
            
        except Exception as e:
            if "already exists" in str(e).lower():
                print(f"   ⚠️  Constraint {constraint_name} already exists")
                success_count += 1
            else:
                print(f"   ❌ Failed to create {constraint_name}: {e}")
    
    cursor.close()
    return success_count

def fix_parse_errors():
    """Fix foreign keys with parse errors."""
    print("\n🔧 Fixing Parse Error Foreign Keys...")
    
    # Read the original file
    with open('oracle_foreign_keys_fixed.sql', 'r') as f:
        lines = f.readlines()
    
    fixed_fks = []
    
    for i, line in enumerate(lines, 1):
        line = line.strip()
        if not line or line.startswith('--'):
            continue
        
        # Fix missing constraint names
        if 'ADD CONSTRAINT  FOREIGN KEY' in line:
            # Extract table name for generating constraint name
            table_match = re.search(r'ALTER TABLE (\w+)', line)
            if table_match:
                table_name = table_match.group(1)
                constraint_name = f"{table_name}_FK_FIXED_{i:03d}"
                fixed_line = line.replace('ADD CONSTRAINT  FOREIGN KEY', f'ADD CONSTRAINT {constraint_name} FOREIGN KEY')
                fixed_fks.append(fixed_line)
                print(f"   🔧 Fixed missing constraint name in line {i}")
        
        # Fix broken reference syntax (spaces in column names)
        elif re.search(r'REFERENCES \w+ \(\w+\s+\w+\)', line):
            # Fix spaces in column names like "CLUSTAI D" -> "CLUSTAID"
            fixed_line = re.sub(r'REFERENCES (\w+) \((\w+)\s+(\w+)\)', r'REFERENCES \1 (\2\3)', line)
            fixed_fks.append(fixed_line)
            print(f"   🔧 Fixed broken reference syntax in line {i}")
        
        # Handle completely malformed lines that need manual reconstruction
        elif 'FOREIGN KEY' in line and 'REFERENCES' in line and not re.match(r'ALTER TABLE \w+ ADD CONSTRAINT \w+ FOREIGN KEY', line):
            print(f"   ⚠️  Complex parse error in line {i}, needs manual review: {line[:80]}...")
        
        else:
            # Line looks okay, keep as-is
            if 'ALTER TABLE' in line and 'FOREIGN KEY' in line:
                fixed_fks.append(line)
    
    # Write fixed foreign keys
    with open('oracle_foreign_keys_remaining.sql', 'w') as f:
        for fk in fixed_fks:
            f.write(fk + '\n')
    
    print(f"   ✅ Created oracle_foreign_keys_remaining.sql with {len(fixed_fks)} fixed constraints")
    return len(fixed_fks)

def main():
    """Main execution function."""
    print("🚀 Analyzing and Fixing Remaining Foreign Key Issues...")
    print("=" * 70)
    
    # Connect to Oracle
    connection = connect_to_oracle()
    if not connection:
        return
    
    # Analyze failed foreign keys
    parse_errors, missing_keys = analyze_failed_fks()
    
    print(f"\n📊 Analysis Results:")
    print(f"   Parse Errors: {len(parse_errors)}")
    print(f"   Missing Parent Keys: {len(missing_keys)}")
    
    # Check missing parent keys
    check_missing_parent_keys(connection)
    
    # Create missing constraints
    created_count = create_missing_constraints(connection)
    
    # Fix parse errors
    fixed_count = fix_parse_errors()
    
    print(f"\n" + "=" * 70)
    print(f"📋 REMEDIATION SUMMARY:")
    print(f"✅ Created missing parent constraints: {created_count}")
    print(f"✅ Fixed parse errors: {fixed_count}")
    print(f"📄 Generated oracle_foreign_keys_remaining.sql for deployment")
    
    connection.close()

if __name__ == "__main__":
    main()