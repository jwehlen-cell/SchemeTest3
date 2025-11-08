#!/usr/bin/env python3
"""
Extract table definitions from USNDC schema, removing foreign key constraints
"""

import re

# Read the original schema file
with open('usndc_schema.sql', 'r') as f:
    content = f.read()

# Find all CREATE TABLE statements using regex
table_pattern = re.compile(r'CREATE TABLE\s+(\w+)\s*\((.*?)\);', re.DOTALL | re.IGNORECASE)
tables = table_pattern.findall(content)

print(f"Found {len(tables)} tables in the schema")

# Process each table to remove foreign key constraints
clean_tables = []
for table_name, table_body in tables:
    lines = table_body.strip().split('\n')
    clean_lines = []
    
    for line in lines:
        line = line.strip()
        # Skip foreign key constraints and references
        if (line.upper().startswith('CONSTRAINT') and 'FOREIGN KEY' in line.upper()) or \
           (line.upper().startswith('FOREIGN KEY')) or \
           ('REFERENCES' in line.upper() and 'CONSTRAINT' in line.upper()):
            continue
        clean_lines.append(line)
    
    # Clean up trailing comma on last column
    if clean_lines and clean_lines[-1].endswith(','):
        clean_lines[-1] = clean_lines[-1].rstrip(',')
    
    clean_body = '\n    '.join(clean_lines)
    clean_tables.append((table_name, clean_body))

# Write the clean tables file
with open('usndc_tables_clean.sql', 'w') as f:
    f.write("-- USNDC Schema - Tables Only (Clean)\n")
    f.write("-- Generated from original schema with foreign keys removed\n\n")
    
    # Write DROP statements first
    f.write("-- Drop existing tables\n")
    for table_name, _ in clean_tables:
        f.write(f"DROP TABLE IF EXISTS {table_name} CASCADE;\n")
    f.write("\n")
    
    # Write CREATE TABLE statements
    f.write("-- Create tables without foreign key constraints\n")
    for table_name, table_body in clean_tables:
        f.write(f"CREATE TABLE {table_name} (\n    {table_body}\n);\n\n")

print(f"Created usndc_tables_clean.sql with {len(clean_tables)} tables")

# Also extract foreign key constraints for later
fk_pattern = re.compile(r'ALTER TABLE.*?ADD CONSTRAINT.*?FOREIGN KEY.*?;', re.DOTALL | re.IGNORECASE)
constraints = fk_pattern.findall(content)

with open('usndc_foreign_keys.sql', 'w') as f:
    f.write("-- USNDC Schema - Foreign Key Constraints\n")
    f.write("-- Apply these after all tables are created\n\n")
    
    for constraint in constraints:
        f.write(constraint + "\n\n")

print(f"Created usndc_foreign_keys.sql with {len(constraints)} foreign key constraints")