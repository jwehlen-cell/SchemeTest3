#!/usr/bin/env python3
"""
Fix PostgreSQL syntax errors in usndc_postgres_schema.sql
- Remove leading commas from PRIMARY KEY clauses
- Remove leading commas from CONSTRAINT clauses
- Fix other SQL syntax issues
"""

import re

def fix_sql_syntax(input_file, output_file):
    """Fix common SQL syntax errors in the schema file"""
    
    print(f"🔧 Reading {input_file}...")
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    print("📝 Applying syntax fixes...")
    
    # Fix 1: Remove leading commas from PRIMARY KEY clauses
    content = re.sub(r'^\s*,\s*PRIMARY KEY', '    PRIMARY KEY', content, flags=re.MULTILINE)
    
    # Fix 2: Remove leading commas from CONSTRAINT clauses  
    content = re.sub(r'^\s*,\s*CONSTRAINT', '    CONSTRAINT', content, flags=re.MULTILINE)
    
    # Fix 3: Remove leading commas from CHECK clauses that aren't part of CONSTRAINT
    content = re.sub(r'^\s*,\s*CHECK', '    CHECK', content, flags=re.MULTILINE)
    
    # Fix 4: Fix reserved keyword issues - 'array' is reserved in PostgreSQL
    content = re.sub(r'\barray\s+VARCHAR', 'array_field VARCHAR', content)
    
    # Fix 5: Fix malformed FOREIGN KEY references (spaces in names)
    content = re.sub(r'REFERENCES\s+(\w+)\s+\((\w+)\s+(\w+)\)', r'REFERENCES \1 (\2\3)', content)
    
    # Fix 6: Fix broken table references in foreign keys
    content = re.sub(r'\(\s*(\w+)\s+(\w+)\s*\)', r'(\1\2)', content)
    
    # Count fixes applied
    lines_with_commas = len(re.findall(r'^\s*,\s*(PRIMARY KEY|CONSTRAINT)', content, flags=re.MULTILINE))
    
    print(f"✅ Applied syntax fixes")
    print(f"   - Fixed leading comma issues")
    print(f"   - Fixed reserved keyword 'array'")
    print(f"   - Fixed malformed foreign key references")
    
    print(f"💾 Writing corrected file to {output_file}...")
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(content)
    
    # Get file stats
    line_count = content.count('\n')
    size_kb = len(content.encode('utf-8')) / 1024
    
    print(f"📊 File statistics:")
    print(f"   - Lines: {line_count:,}")
    print(f"   - Size: {size_kb:.1f} KB")
    print(f"✅ Syntax correction completed!")

if __name__ == "__main__":
    input_file = "usndc_postgres_schema.sql"
    output_file = "usndc_postgres_schema_fixed.sql"
    
    try:
        fix_sql_syntax(input_file, output_file)
        print(f"\n🚀 Ready to deploy: {output_file}")
    except Exception as e:
        print(f"❌ Error: {e}")