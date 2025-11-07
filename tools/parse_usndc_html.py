#!/usr/bin/env python3
"""
USNDC HTML Parser - Extract schema from USNDC_Tables_A_to_Z.html

Parses the SQL*Plus HTML output to extract table names, columns, 
data types, and descriptions for all USNDC database tables.
"""

import re
from pathlib import Path

def parse_usndc_html(html_file_path):
    """Parse the USNDC HTML file to extract table schema information."""
    
    with open(html_file_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
    
    tables = {}
    
    # Split content by table sections - look for TABLE_NAME patterns
    table_sections = re.split(r'<th scope="col">\s*TABLE_NAME\s*</th>', content)
    
    for i, section in enumerate(table_sections[1:], 1):  # Skip first empty section
        try:
            # Extract table name
            table_name_match = re.search(r'<td>\s*([A-Z_0-9]+)\s*</td>', section)
            if not table_name_match:
                continue
                
            table_name = table_name_match.group(1).strip()
            print(f"Found table: {table_name}")
            
            # Extract table description/comments
            comments_match = re.search(r'<th scope="col">\s*COMMENTS\s*</th>.*?<td>\s*(.*?)\s*</td>', section, re.DOTALL)
            table_description = comments_match.group(1).strip() if comments_match else f'Table {table_name}'
            
            # Clean up HTML entities and formatting
            table_description = re.sub(r'<[^>]+>', '', table_description)  # Remove HTML tags
            table_description = re.sub(r'\s+', ' ', table_description)  # Normalize whitespace
            
            # Extract columns section
            columns_match = re.search(
                r'<th scope="col">\s*COLUMN_NAME\s*</th>.*?<th scope="col">\s*DATA_TYPE\s*</th>.*?<th scope="col">\s*COLUMN_COMMENTS\s*</th>(.*?)(?=<table|$)', 
                section, re.DOTALL
            )
            
            if not columns_match:
                continue
                
            columns_section = columns_match.group(1)
            
            # Extract individual column rows
            column_rows = re.findall(
                r'<tr>\s*<td>\s*([A-Z_0-9]+)\s*</td>\s*<td>\s*([^<]+?)\s*</td>\s*<td>\s*(.*?)\s*</td>\s*</tr>',
                columns_section,
                re.DOTALL
            )
            
            columns = []
            for col_name, col_type, col_comment in column_rows:
                # Clean up column comment
                col_comment = re.sub(r'<[^>]+>', '', col_comment)  # Remove HTML tags
                col_comment = re.sub(r'\s+', ' ', col_comment.strip())  # Normalize whitespace
                
                columns.append({
                    'name': col_name.strip(),
                    'type': col_type.strip(),
                    'comment': col_comment,
                    'nullable': True,  # Default assumption
                    'primary_key': False  # Default assumption
                })
            
            if columns:
                tables[table_name] = {
                    'description': table_description,
                    'columns': columns
                }
                print(f"  Added {len(columns)} columns for {table_name}")
            
        except Exception as e:
            print(f"  Warning: Error parsing section {i}: {e}")
            continue
    
    return tables

def generate_usndc_tables_txt(tables_data, output_file):
    """Generate USNDC_tables.txt file in the same format as Legacy and NDC PLUS files."""
    
    with open(output_file, 'w') as f:
        f.write("-- USNDC Database Schema Tables\n")
        f.write("-- Extracted from USNDC_Tables_A_to_Z.html\n")
        f.write(f"-- Total tables: {len(tables_data)}\n\n")
        
        for table_name, table_info in sorted(tables_data.items()):
            f.write(f"Table: {table_name}\n")
            f.write(f"Description: {table_info['description']}\n")
            f.write("Columns:\n")
            
            for col in table_info['columns']:
                nullable = "NULL" if col['nullable'] else "NOT NULL"
                pk_indicator = " (PK)" if col['primary_key'] else ""
                f.write(f"  {col['name']} {col['type']} {nullable}{pk_indicator}")
                if col['comment']:
                    f.write(f" -- {col['comment']}")
                f.write("\n")
            
            f.write("\n")

def main():
    """Main execution function."""
    print("🔍 USNDC HTML Schema Parser\n")
    
    # Paths
    base_dir = Path(__file__).parent.parent
    html_file = base_dir / 'USNDC_Tables_A_to_Z.html'
    output_file = base_dir / 'USNDC_tables.txt'
    
    if not html_file.exists():
        print(f"❌ HTML file not found: {html_file}")
        return
    
    # Parse the HTML file
    print(f"📄 Parsing {html_file.name}...")
    tables_data = parse_usndc_html(html_file)
    
    print(f"✓ Found {len(tables_data)} USNDC tables")
    
    # Generate output file
    print(f"📝 Generating {output_file.name}...")
    generate_usndc_tables_txt(tables_data, output_file)
    
    print(f"✅ USNDC schema extraction complete!")
    print(f"   Output: {output_file}")
    print(f"   Tables: {len(tables_data)}")
    
    # Print summary
    print("\n📊 Table Summary:")
    for table_name, table_info in sorted(tables_data.items()):
        print(f"  {table_name} ({len(table_info['columns'])} columns)")

if __name__ == "__main__":
    main()