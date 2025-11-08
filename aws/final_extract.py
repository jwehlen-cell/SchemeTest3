#!/usr/bin/env python3
"""
Extract tables and remove inline comments that might cause parsing issues
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
            # Process the table to remove foreign key constraints and clean comments
            clean_table = []
            for tline in table_lines:
                # Skip foreign key constraints
                if 'REFERENCES' in tline.upper() or 'FOREIGN KEY' in tline.upper():
                    continue
                # Skip standalone constraint lines (but keep primary keys)
                if (tline.strip().upper().startswith('CONSTRAINT') and 
                    'FOREIGN KEY' in tline.upper()):
                    continue
                
                # Remove inline comments to avoid parsing issues
                if '--' in tline:
                    # Split at the first -- to remove comments
                    cleaned_line = tline.split('--')[0].rstrip()
                    if cleaned_line.strip():  # Only add if there's actual content
                        clean_table.append(cleaned_line)
                else:
                    clean_table.append(tline)
            
            # Clean up the last column line to remove trailing comma if needed
            if len(clean_table) > 1:
                last_content_line_idx = -2  # Second to last (before closing paren)
                while last_content_line_idx >= 0:
                    if clean_table[last_content_line_idx].strip() and not clean_table[last_content_line_idx].strip().startswith('--'):
                        if clean_table[last_content_line_idx].rstrip().endswith(','):
                            clean_table[last_content_line_idx] = clean_table[last_content_line_idx].rstrip().rstrip(',')
                        break
                    last_content_line_idx -= 1
            
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
with open('usndc_tables_final.sql', 'w') as f:
    f.write('\n'.join(output_lines))

print("Created usndc_tables_final.sql with clean table definitions (no inline comments)")