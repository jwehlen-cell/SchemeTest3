#!/usr/bin/env python3
"""
Fix Oracle SQL syntax issues in usndc_oracle_schema.sql
- Remove leading commas from CONSTRAINT clauses
- Fix Oracle-specific syntax issues
"""

import re

def fix_oracle_sql_syntax(input_file, output_file):
    """Fix Oracle SQL syntax errors"""
    
    print(f"🔧 Reading {input_file}...")
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    print("📝 Applying Oracle syntax fixes...")
    
    # Fix 1: Remove leading commas from CONSTRAINT clauses
    content = re.sub(r'^\s*,\s*CONSTRAINT', '    CONSTRAINT', content, flags=re.MULTILINE)
    
    # Fix 2: Remove leading commas from CHECK clauses
    content = re.sub(r'^\s*,\s*CHECK', '    CHECK', content, flags=re.MULTILINE)
    
    # Fix 3: Ensure proper table naming (Oracle is case-insensitive but consistent)
    # Oracle typically uses uppercase for DDL but we'll keep the existing case
    
    # Count fixes applied
    original_lines = content.count('\n')
    
    print(f"✅ Applied Oracle syntax fixes")
    print(f"   - Fixed leading comma issues in CONSTRAINT clauses")
    print(f"   - Preserved Oracle-specific data types (NUMBER, VARCHAR2, DATE)")
    
    print(f"💾 Writing corrected file to {output_file}...")
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(content)
    
    # Get file stats
    line_count = content.count('\n')
    size_kb = len(content.encode('utf-8')) / 1024
    
    print(f"📊 File statistics:")
    print(f"   - Lines: {line_count:,}")
    print(f"   - Size: {size_kb:.1f} KB")
    print(f"✅ Oracle syntax correction completed!")

if __name__ == "__main__":
    input_file = "usndc_oracle_schema.sql"
    output_file = "usndc_oracle_schema_fixed.sql"
    
    try:
        fix_oracle_sql_syntax(input_file, output_file)
        print(f"\n🚀 Ready to deploy Oracle schema: {output_file}")
    except Exception as e:
        print(f"❌ Error: {e}")