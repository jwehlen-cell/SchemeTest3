#!/usr/bin/env python3

import re
import sys

def extract_complete_tables(input_file):
    """Extract all CREATE TABLE statements and separate foreign key constraints."""
    
    with open(input_file, 'r') as f:
        content = f.read()
    
    # Find all CREATE TABLE statements with their complete definitions
    create_table_pattern = r'CREATE TABLE\s+(\w+)\s*\((.*?)\);'
    tables = re.findall(create_table_pattern, content, re.DOTALL | re.IGNORECASE)
    
    print(f"Found {len(tables)} CREATE TABLE statements")
    
    tables_only = []
    foreign_keys = []
    
    for table_name, table_body in tables:
        # Split table body into lines
        lines = table_body.strip().split('\n')
        cleaned_lines = []
        
        for line in lines:
            line = line.strip()
            if not line:
                continue
                
            # Check if this line contains a foreign key constraint
            if ('FOREIGN KEY' in line.upper() or 
                ('REFERENCES' in line.upper() and 'CONSTRAINT' in line.upper())):
                # This is a foreign key constraint - save for later
                foreign_keys.append(f"ALTER TABLE {table_name} ADD {line.rstrip(',')};")
            else:
                # Remove inline comments and fix comma placement
                if '--' in line:
                    # Split on comment, keep the part before comment
                    code_part = line.split('--')[0].strip()
                    if code_part:
                        # Ensure proper comma placement
                        if not code_part.endswith(',') and not code_part.endswith('(') and not code_part.startswith('CONSTRAINT'):
                            code_part += ','
                        cleaned_lines.append(code_part)
                else:
                    # No comment, add comma if needed
                    if not line.endswith(',') and not line.endswith('(') and not line.startswith('CONSTRAINT'):
                        line += ','
                    cleaned_lines.append(line)
        
        # Remove last comma from the last column definition
        if cleaned_lines and cleaned_lines[-1].endswith(','):
            cleaned_lines[-1] = cleaned_lines[-1][:-1]
        
        # Reconstruct table definition
        table_def = f"CREATE TABLE {table_name} (\n    " + ',\n    '.join(cleaned_lines) + "\n);"
        tables_only.append(table_def)
    
    # Also find ALTER TABLE statements that add foreign keys
    alter_fk_pattern = r'ALTER TABLE\s+\w+\s+ADD.*?FOREIGN KEY.*?;'
    alter_fks = re.findall(alter_fk_pattern, content, re.DOTALL | re.IGNORECASE)
    foreign_keys.extend(alter_fks)
    
    return tables_only, foreign_keys

def main():
    input_file = 'usndc_schema.sql'
    
    print("🔍 Extracting complete table definitions...")
    tables_only, foreign_keys = extract_complete_tables(input_file)
    
    # Write tables without foreign keys
    with open('usndc_tables_complete.sql', 'w') as f:
        f.write("-- USNDC Complete Table Definitions (without foreign keys)\n")
        f.write(f"-- Extracted {len(tables_only)} tables\n\n")
        
        for table in tables_only:
            f.write(table + '\n\n')
    
    # Write foreign key constraints
    with open('usndc_foreign_keys_complete.sql', 'w') as f:
        f.write("-- USNDC Foreign Key Constraints\n")
        f.write(f"-- Extracted {len(foreign_keys)} foreign key constraints\n\n")
        
        for fk in foreign_keys:
            if fk.strip():
                f.write(fk + '\n\n')
    
    print(f"✅ Successfully extracted {len(tables_only)} table definitions")
    print(f"✅ Successfully extracted {len(foreign_keys)} foreign key constraints")
    print("📁 Files created:")
    print("   - usndc_tables_complete.sql (table definitions)")
    print("   - usndc_foreign_keys_complete.sql (foreign key constraints)")

if __name__ == "__main__":
    main()