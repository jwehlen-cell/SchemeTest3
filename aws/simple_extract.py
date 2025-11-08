#!/usr/bin/env python3
"""
Simple extraction of CREATE TABLE statements without foreign keys
"""

# Read the original schema file
with open('usndc_schema.sql', 'r') as f:
    content = f.read()

lines = content.split('\n')
output_lines = []
in_create_table = False
table_lines = []

for line in lines:
    # Check for start of CREATE TABLE
    if line.strip().upper().startswith('CREATE TABLE'):
        in_create_table = True
        table_lines = [line]
        continue
    
    # If we're in a CREATE TABLE block
    if in_create_table:
        # Check for end of table (closing parenthesis and semicolon)
        if line.strip().endswith(');'):
            table_lines.append(line)
            # Process the table to remove foreign key constraints
            clean_table = []
            for tline in table_lines:
                # Skip foreign key constraints
                if 'REFERENCES' in tline.upper() or 'FOREIGN KEY' in tline.upper():
                    continue
                # Skip standalone constraint lines (but keep primary keys)
                if (tline.strip().upper().startswith('CONSTRAINT') and 
                    'FOREIGN KEY' in tline.upper()):
                    continue
                clean_table.append(tline)
            
            # Clean up the last line to remove trailing comma if needed
            if len(clean_table) > 1:
                last_line = clean_table[-2]  # Second to last line (before closing paren)
                if last_line.rstrip().endswith(','):
                    clean_table[-2] = last_line.rstrip().rstrip(',')
            
            output_lines.extend(clean_table)
            output_lines.append('')  # Empty line after each table
            in_create_table = False
            table_lines = []
        else:
            table_lines.append(line)
    
    # For non-CREATE TABLE statements, include DROP statements
    elif ('DROP TABLE' in line.upper() or 
          'CREATE SCHEMA' in line.upper() or
          line.strip().startswith('--')):
        output_lines.append(line)

# Write the clean file
with open('usndc_tables_simple.sql', 'w') as f:
    f.write('\n'.join(output_lines))

print("Created usndc_tables_simple.sql with clean table definitions")