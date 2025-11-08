#!/usr/bin/env python3
"""
Advanced PostgreSQL syntax fixes for usndc_postgres_schema.sql
- Fix broken table names with spaces
- Fix malformed foreign key references
- Fix reserved keyword issues
- Fix other SQL syntax problems
"""

import re

def fix_advanced_sql_syntax(input_file, output_file):
    """Apply comprehensive SQL syntax fixes"""
    
    print(f"🔧 Reading {input_file}...")
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    print("📝 Applying advanced syntax fixes...")
    
    # Fix 1: Remove leading commas from PRIMARY KEY and CONSTRAINT clauses
    content = re.sub(r'^\s*,\s*PRIMARY KEY', '    PRIMARY KEY', content, flags=re.MULTILINE)
    content = re.sub(r'^\s*,\s*CONSTRAINT', '    CONSTRAINT', content, flags=re.MULTILINE)
    content = re.sub(r'^\s*,\s*CHECK', '    CHECK', content, flags=re.MULTILINE)
    
    # Fix 2: Fix broken table names with spaces
    broken_tables = {
        'classification_declassify _on': 'classification_declassify_on',
        'classification_derived_fr om': 'classification_derived_from', 
        'classification_disseminat ion': 'classification_dissemination'
    }
    
    for broken_name, correct_name in broken_tables.items():
        content = content.replace(broken_name, correct_name)
        print(f"   - Fixed table name: {broken_name} -> {correct_name}")
    
    # Fix 3: Fix reserved keyword 'array' 
    content = re.sub(r'\barray\s+VARCHAR', 'array_field VARCHAR', content)
    
    # Fix 4: Fix malformed foreign key references with spaces in column names
    # Pattern: REFERENCES table_name (col name) -> REFERENCES table_name (colname)
    content = re.sub(r'REFERENCES\s+(\w+)\s+\(([^)]+)\s+([^)]+)\)', r'REFERENCES \1 (\2\3)', content)
    
    # Fix 5: Fix specific foreign key syntax issues found in logs
    content = re.sub(r'CONSTRAINT\s+FOREIGN KEY', 'CONSTRAINT fk_temp FOREIGN KEY', content)
    
    # Fix 6: Fix table creation syntax with missing table names
    # Look for CREATE TABLE statements that might be malformed
    content = re.sub(r'CREATE TABLE IF NOT EXISTS\s+(\w+)\s+(\w+)\s*\(', r'CREATE TABLE IF NOT EXISTS \1\2 (', content)
    
    # Fix 7: Fix comment references to broken table names
    for broken_name, correct_name in broken_tables.items():
        content = content.replace(f'COMMENT ON TABLE {broken_name}', f'COMMENT ON TABLE {correct_name}')
        content = content.replace(f'COMMENT ON COLUMN {broken_name}.', f'COMMENT ON COLUMN {correct_name}.')
    
    # Fix 8: Remove duplicate constraint names that might cause conflicts
    # Find and fix constraint naming issues
    content = re.sub(r'CONSTRAINT\s+(\w+)_fk\s+FOREIGN KEY.*?REFERENCES.*?(\w+).*?already exists', '', content, flags=re.MULTILINE | re.DOTALL)
    
    print(f"✅ Applied comprehensive syntax fixes")
    
    print(f"💾 Writing corrected file to {output_file}...")
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(content)
    
    # Get file stats
    line_count = content.count('\n')
    size_kb = len(content.encode('utf-8')) / 1024
    
    print(f"📊 File statistics:")
    print(f"   - Lines: {line_count:,}")
    print(f"   - Size: {size_kb:.1f} KB")
    print(f"✅ Advanced syntax correction completed!")

if __name__ == "__main__":
    input_file = "usndc_postgres_schema.sql"
    output_file = "usndc_postgres_schema_final.sql"
    
    try:
        fix_advanced_sql_syntax(input_file, output_file)
        print(f"\n🚀 Ready to deploy: {output_file}")
    except Exception as e:
        print(f"❌ Error: {e}")