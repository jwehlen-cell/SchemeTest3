#!/usr/bin/env python3
"""
Create a robust table extraction that handles all SQL edge cases properly
"""
import re

def extract_create_tables(sql_content):
    """Extract CREATE TABLE statements with proper handling of commas and comments"""
    
    # Remove foreign key constraints first
    lines = sql_content.split('\n')
    filtered_lines = []
    
    for line in lines:
        # Skip lines that contain foreign key references
        if re.search(r'REFERENCES\s+\w+|FOREIGN\s+KEY', line, re.IGNORECASE):
            continue
        # Skip constraint lines that are foreign keys
        if re.search(r'CONSTRAINT\s+\w+.*FOREIGN\s+KEY', line, re.IGNORECASE):
            continue
        filtered_lines.append(line)
    
    # Now process the filtered content
    content = '\n'.join(filtered_lines)
    
    # Find all CREATE TABLE blocks
    table_pattern = re.compile(
        r'(CREATE\s+TABLE\s+\w+\s*\([^;]+\);)', 
        re.DOTALL | re.IGNORECASE
    )
    
    tables = []
    for match in table_pattern.finditer(content):
        table_sql = match.group(1)
        
        # Clean up comments while preserving SQL structure
        lines = table_sql.split('\n')
        cleaned_lines = []
        
        for line in lines:
            if '--' in line:
                # Split at comment, keep everything before it
                before_comment = line.split('--')[0]
                # Strip whitespace but preserve the line if it has content
                cleaned = before_comment.rstrip()
                if cleaned.strip():
                    cleaned_lines.append(cleaned)
            else:
                cleaned_lines.append(line)
        
        # Join back and ensure proper formatting
        cleaned_table = '\n'.join(cleaned_lines)
        tables.append(cleaned_table)
    
    return tables

def create_deployment_batches(tables, batch_size=10):
    """Create smaller batches for safer deployment"""
    batches = []
    for i in range(0, len(tables), batch_size):
        batch = tables[i:i + batch_size]
        batches.append(batch)
    return batches

# Read the original schema
with open('usndc_schema.sql', 'r') as f:
    schema_content = f.read()

print("Extracting CREATE TABLE statements...")
tables = extract_create_tables(schema_content)
print(f"Found {len(tables)} CREATE TABLE statements")

# Create batches for safer deployment
batches = create_deployment_batches(tables, 20)  # 20 tables per batch
print(f"Created {len(batches)} deployment batches")

# Create individual batch files
for i, batch in enumerate(batches, 1):
    filename = f'usndc_batch_{i:02d}.sql'
    with open(filename, 'w') as f:
        f.write(f"-- USNDC Schema Deployment Batch {i}\n")
        f.write(f"-- Tables in this batch: {len(batch)}\n\n")
        
        for table_sql in batch:
            f.write(table_sql + '\n\n')
    
    print(f"Created {filename} with {len(batch)} tables")

# Also create a complete file with proper DROP statements
print("Creating complete deployment file...")
with open('usndc_complete_deployment.sql', 'w') as f:
    f.write("-- Complete USNDC Schema Deployment\n")
    f.write(f"-- Total tables: {len(tables)}\n\n")
    
    # Add DROP statements for clean deployment
    f.write("-- Drop all tables first (ignore errors)\n")
    for table_sql in tables:
        # Extract table name
        table_match = re.search(r'CREATE\s+TABLE\s+(\w+)', table_sql, re.IGNORECASE)
        if table_match:
            table_name = table_match.group(1)
            f.write(f"DROP TABLE IF EXISTS {table_name} CASCADE;\n")
    
    f.write("\n-- Create all tables\n")
    for table_sql in tables:
        f.write(table_sql + '\n\n')

print("Schema extraction complete!")