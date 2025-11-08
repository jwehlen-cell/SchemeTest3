#!/usr/bin/env python3
"""
Create a fixed version of the USNDC schema with proper CREATE TABLE statements
and foreign keys separated into a second file.
"""

import re

# Read the original schema file
with open('usndc_schema.sql', 'r') as f:
    content = f.read()

# Split into individual SQL statements
statements = content.split(';')

table_statements = []
constraint_statements = []
other_statements = []

for statement in statements:
    statement = statement.strip()
    if not statement:
        continue
        
    # Check if this is a CREATE TABLE statement
    if statement.upper().startswith('CREATE TABLE'):
        # Find the table definition
        lines = statement.split('\n')
        table_lines = []
        in_table = False
        
        for line in lines:
            line = line.strip()
            if line.upper().startswith('CREATE TABLE'):
                in_table = True
                table_lines.append(line)
            elif in_table:
                # Skip constraint lines that reference other tables
                if ('REFERENCES' in line.upper() or 
                    'FOREIGN KEY' in line.upper() or
                    'CONSTRAINT' in line.upper() and 'PRIMARY KEY' not in line.upper()):
                    # This is a foreign key constraint - skip it
                    continue
                else:
                    table_lines.append(line)
        
        # Reconstruct the table statement
        if table_lines:
            # Clean up the last line to ensure proper closing
            last_line = table_lines[-1]
            if last_line.endswith(','):
                table_lines[-1] = last_line.rstrip(',')
            
            table_statement = '\n'.join(table_lines)
            if not table_statement.endswith(')'):
                table_statement += '\n)'
            table_statements.append(table_statement)
    
    elif ('ALTER TABLE' in statement.upper() or 
          'ADD CONSTRAINT' in statement.upper() or
          'FOREIGN KEY' in statement.upper()):
        constraint_statements.append(statement)
    else:
        other_statements.append(statement)

# Write tables-only file
print("Creating tables-only schema file...")
with open('usndc_tables_fixed.sql', 'w') as f:
    f.write("-- USNDC Schema - Tables Only (Fixed)\n")
    f.write("-- This file contains only table creation statements without foreign key constraints\n\n")
    
    for statement in other_statements:
        if ('DROP TABLE' in statement.upper() or 
            'CREATE SCHEMA' in statement.upper() or
            'SET' in statement.upper()):
            f.write(statement + ';\n')
    
    f.write('\n-- Table Definitions\n')
    for table in table_statements:
        f.write(table + ';\n\n')

# Write constraints file
print("Creating constraints-only file...")
with open('usndc_constraints.sql', 'w') as f:
    f.write("-- USNDC Schema - Constraints Only\n")
    f.write("-- This file contains foreign key constraints and other relationships\n\n")
    
    for constraint in constraint_statements:
        f.write(constraint + ';\n\n')

print(f"Created:")
print(f"  - usndc_tables_fixed.sql ({len(table_statements)} tables)")
print(f"  - usndc_constraints.sql ({len(constraint_statements)} constraints)")