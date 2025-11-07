#!/usr/bin/env python3
"""
USNDC Schema Parser and Documentation Generator

Parses USNDC_tables.txt file and generates:
1. JSON Schema documentation 
2. Markdown documentation with Mermaid diagrams
3. Interactive HTML viewer
"""

import re
import json
from pathlib import Path
from collections import defaultdict


def parse_usndc_schema_file(filepath):
    """Parse the USNDC_tables.txt schema file."""
    
    with open(filepath, 'r') as f:
        content = f.read()
    
    tables = {}
    current_table = None
    current_description = None
    current_columns = []
    
    in_columns_section = False
    
    for line in content.split('\n'):
        line = line.strip()
        
        if line.startswith('Table:'):
            # Save previous table if exists
            if current_table and current_columns:
                tables[current_table] = {
                    'description': current_description or f'Table {current_table}',
                    'columns': current_columns
                }
            
            # Start new table
            current_table = line.split(':', 1)[1].strip()
            current_columns = []
            current_description = None
            in_columns_section = False
            
        elif line.startswith('Description:'):
            current_description = line.split(':', 1)[1].strip()
            in_columns_section = False
            
        elif line.startswith('Columns:'):
            in_columns_section = True
            
        elif in_columns_section and current_table and line and not line.startswith('Table:') and not line.startswith('Description:') and not line.startswith('Columns:'):
            # Parse column definition
            # Format: COLUMN_NAME TYPE [NULL|NOT NULL] [-- comment]
            column_match = re.match(r'(\w+)\s+([A-Z0-9()_,]+)\s+(.*?)(?:\s*--\s*(.*))?$', line)
            if column_match:
                col_name = column_match.group(1)
                col_type = column_match.group(2)
                nullable_part = column_match.group(3) or ''
                comment = column_match.group(4) or ''
                
                nullable = 'NOT NULL' not in nullable_part.upper()
                primary_key = '(PK)' in nullable_part
                
                current_columns.append({
                    'name': col_name,
                    'type': col_type,
                    'nullable': nullable,
                    'primary_key': primary_key,
                    'comment': comment.strip()
                })
    
    # Save last table
    if current_table and current_columns:
        tables[current_table] = {
            'description': current_description or f'Table {current_table}',
            'columns': current_columns
        }
    
    return tables


def identify_table_relationships(tables):
    """Identify potential relationships between tables based on common column names."""
    relationships = []
    
    # Common foreign key patterns
    fk_patterns = [
        r'.*ID$',  # Columns ending in ID
        r'.*_ID$',  # Columns ending in _ID
        r'EVID$', r'ORID$', r'ARID$',  # Seismic-specific IDs
        r'STA$', r'NET$', r'CHAN$'  # Station/Network/Channel references
    ]
    
    for table1_name, table1_info in tables.items():
        for col1 in table1_info['columns']:
            # Look for potential foreign key columns
            for pattern in fk_patterns:
                if re.match(pattern, col1['name'], re.IGNORECASE):
                    # Find matching columns in other tables
                    for table2_name, table2_info in tables.items():
                        if table1_name != table2_name:
                            for col2 in table2_info['columns']:
                                if col1['name'] == col2['name']:
                                    relationships.append({
                                        'from_table': table1_name,
                                        'from_column': col1['name'],
                                        'to_table': table2_name,
                                        'to_column': col2['name'],
                                        'relationship_type': 'potential_foreign_key'
                                    })
    
    return relationships


def generate_usndc_json(tables, relationships):
    """Generate JSON schema from parsed table data."""
    
    schema = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "USNDC Database Schema",
        "description": "United States National Data Center seismic monitoring database schema",
        "version": "3.0.0",
        "database_type": "Oracle",
        "table_count": len(tables),
        "tables": {},
        "relationships": relationships
    }
    
    # Process tables
    for table_name, table_info in tables.items():
        table_schema = {
            "description": table_info['description'],
            "columns": {}
        }
        
        for col in table_info['columns']:
            table_schema["columns"][col['name']] = {
                "type": map_oracle_type_to_json(col['type']),
                "oracle_type": col['type'],
                "nullable": col['nullable'],
                "primary_key": col['primary_key'],
                "comment": col['comment']
            }
        
        schema["tables"][table_name] = table_schema
    
    return schema


def map_oracle_type_to_json(oracle_type):
    """Map Oracle data types to JSON Schema types."""
    oracle_type = oracle_type.upper()
    
    if 'NUMBER' in oracle_type or 'FLOAT' in oracle_type:
        return "number"
    elif 'VARCHAR' in oracle_type or 'CHAR' in oracle_type or 'CLOB' in oracle_type:
        return "string"
    elif 'DATE' in oracle_type or 'TIMESTAMP' in oracle_type:
        return "string"  # ISO date format
    elif 'RAW' in oracle_type:
        return "string"  # Base64 encoded
    else:
        return "string"  # Default


def generate_usndc_mermaid(tables, relationships):
    """Generate Mermaid ER diagram for USNDC schema."""
    
    mermaid = ["erDiagram"]
    mermaid.append("")
    
    # Add tables with key columns
    for table_name, table_info in sorted(tables.items()):
        # Group columns by type for cleaner display
        pk_columns = [col for col in table_info['columns'] if col['primary_key']]
        key_columns = [col for col in table_info['columns'] if not col['primary_key'] and ('ID' in col['name'] or col['name'] in ['STA', 'NET', 'CHAN', 'EVID', 'ORID', 'ARID'])]
        
        mermaid.append(f"    {table_name} {{")
        
        # Add primary keys first
        for col in pk_columns:
            mermaid.append(f"        {col['type']} {col['name']} PK")
        
        # Add key columns
        for col in key_columns[:5]:  # Limit to avoid clutter
            mermaid.append(f"        {col['type']} {col['name']}")
        
        # Add ellipsis if there are more columns
        if len(table_info['columns']) > len(pk_columns) + len(key_columns):
            remaining = len(table_info['columns']) - len(pk_columns) - len(key_columns)
            mermaid.append(f"        string ... \"+{remaining} more\"")
        
        mermaid.append("    }")
        mermaid.append("")
    
    # Add relationships (limit to avoid clutter)
    added_relationships = set()
    relationship_count = 0
    
    for rel in relationships:
        if relationship_count >= 50:  # Limit relationships to keep diagram readable
            break
            
        rel_key = (rel['from_table'], rel['to_table'])
        reverse_key = (rel['to_table'], rel['from_table'])
        
        if rel_key not in added_relationships and reverse_key not in added_relationships:
            mermaid.append(f"    {rel['from_table']} ||--o{{ {rel['to_table']} : \"{rel['from_column']}\"")
            added_relationships.add(rel_key)
            relationship_count += 1
    
    return '\n'.join(mermaid)


def generate_usndc_markdown(tables, relationships):
    """Generate comprehensive Markdown documentation for USNDC schema."""
    
    doc = []
    
    # Header
    doc.append("# USNDC Database Schema Documentation\n")
    doc.append("## Overview\n")
    doc.append(f"This documentation covers the United States National Data Center (USNDC) database schema for seismic event monitoring, ")
    doc.append(f"waveform analysis, and location determination. The schema contains {len(tables)} tables with comprehensive ")
    doc.append("coverage of seismic data processing, event detection, and quality control.\n\n")
    
    # Schema Statistics
    doc.append("## Schema Statistics\n")
    doc.append(f"- **Total Tables**: {len(tables)}\n")
    doc.append(f"- **Total Relationships**: {len(relationships)}\n")
    
    total_columns = sum(len(table_info['columns']) for table_info in tables.values())
    doc.append(f"- **Total Columns**: {total_columns}\n")
    doc.append(f"- **Database Type**: Oracle\n\n")
    
    # Entity Relationship Diagram
    doc.append("## Entity Relationship Diagram\n")
    doc.append("```mermaid\n")
    doc.append(generate_usndc_mermaid(tables, relationships))
    doc.append("\n```\n\n")
    
    # Table Categories
    doc.append("## Table Categories\n")
    
    categories = {
        "Core Seismic Data": ["EVENT", "ORIGIN", "ARRIVAL", "ASSOC", "AMPLITUDE", "NETMAG", "STAMAG"],
        "Station and Network": ["SITE", "SITECHAN", "AFFILIATION", "NETWORK", "SENSOR", "INSTRUMENT"],
        "Waveform Data": ["WFDISC", "WFTAG", "WFFILE", "WFCONV", "WFAUDIT", "WFACTIVITY"],
        "Quality Control": ["QCMASKDEF", "QCMASKINFO", "QCMASKSEG"],
        "Processing and Detection": ["DETECTION", "FILTER", "ALGORITHM", "PROCESSING_RECIPE"],
        "User and System": ["DATAUSER", "USER_PRIVILEGES", "REMARK", "TIMESTAMP"]
    }
    
    for category, table_list in categories.items():
        doc.append(f"### {category}\n")
        for table_name in table_list:
            if table_name in tables:
                doc.append(f"- **{table_name}**: {tables[table_name]['description']}\n")
        doc.append("\n")
    
    # All other tables
    categorized_tables = set()
    for table_list in categories.values():
        categorized_tables.update(table_list)
    
    other_tables = [name for name in sorted(tables.keys()) if name not in categorized_tables]
    if other_tables:
        doc.append("### Other Tables\n")
        for table_name in other_tables[:20]:  # Limit to first 20 to avoid overwhelming
            doc.append(f"- **{table_name}**: {tables[table_name]['description']}\n")
        if len(other_tables) > 20:
            doc.append(f"- ... and {len(other_tables) - 20} more tables\n")
        doc.append("\n")
    
    # Detailed Table Specifications
    doc.append("## Detailed Table Specifications\n")
    
    for table_name, table_info in sorted(tables.items()):
        doc.append(f"### {table_name}\n")
        doc.append(f"**Description**: {table_info['description']}\n\n")
        
        doc.append("| Column | Type | Nullable | Primary Key | Description |\n")
        doc.append("|--------|------|----------|-------------|-------------|\n")
        
        for col in table_info['columns']:
            nullable = "✓" if col['nullable'] else "✗"
            pk = "✓" if col['primary_key'] else "✗"
            comment = col['comment'] or ""
            
            doc.append(f"| {col['name']} | {col['type']} | {nullable} | {pk} | {comment} |\n")
        
        doc.append("\n")
    
    return ''.join(doc)


def main():
    """Main execution function."""
    print("🔍 USNDC Schema Parser and Documentation Generator\n")
    
    # Paths
    base_dir = Path(__file__).parent.parent
    usndc_file = base_dir / 'USNDC_tables.txt'
    output_dir = base_dir / 'schema'
    docs_dir = output_dir / 'docs'
    
    # Create output directories
    output_dir.mkdir(exist_ok=True)
    docs_dir.mkdir(exist_ok=True)
    
    if not usndc_file.exists():
        print(f"❌ USNDC tables file not found: {usndc_file}")
        return
    
    # Parse schema
    print(f"📄 Parsing {usndc_file.name}...")
    usndc_tables = parse_usndc_schema_file(usndc_file)
    print(f"✓ Found {len(usndc_tables)} USNDC tables")
    
    # Identify relationships
    print("🔗 Identifying relationships...")
    relationships = identify_table_relationships(usndc_tables)
    print(f"✓ Found {len(relationships)} potential relationships")
    
    # Generate outputs
    print("📝 Generating documentation...")
    
    # JSON Schema
    json_schema = generate_usndc_json(usndc_tables, relationships)
    json_file = output_dir / 'usndc_schema.json'
    with open(json_file, 'w') as f:
        json.dump(json_schema, f, indent=2)
    print(f"✓ JSON schema: {json_file}")
    
    # Markdown documentation
    markdown_content = generate_usndc_markdown(usndc_tables, relationships)
    md_file = docs_dir / 'USNDC_SCHEMA.md'
    with open(md_file, 'w') as f:
        f.write(markdown_content)
    print(f"✓ Markdown docs: {md_file}")
    
    # Mermaid diagram
    mermaid_content = generate_usndc_mermaid(usndc_tables, relationships)
    mermaid_file = base_dir / 'USNDC_schema.mmd'
    with open(mermaid_file, 'w') as f:
        f.write(mermaid_content)
    print(f"✓ Mermaid diagram: {mermaid_file}")
    
    print(f"\n✅ USNDC schema documentation generated successfully!")
    print(f"   Tables: {len(usndc_tables)}")
    print(f"   Relationships: {len(relationships)}")
    print(f"   Total columns: {sum(len(table_info['columns']) for table_info in usndc_tables.values())}")


if __name__ == "__main__":
    main()