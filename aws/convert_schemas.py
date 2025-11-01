#!/usr/bin/env python3

"""
Oracle to PostgreSQL Schema Converter
Converts Oracle DDL from text files to PostgreSQL DDL scripts
"""

import re
import sys
from typing import List, Dict, Tuple

def oracle_to_postgres_type(oracle_type: str) -> str:
    """Convert Oracle data types to PostgreSQL equivalents"""
    oracle_type = oracle_type.strip().upper()
    
    # NUMBER mappings
    if oracle_type.startswith('NUMBER'):
        if '(' in oracle_type:
            # Extract precision and scale
            match = re.search(r'NUMBER\((\d+)(?:,(\d+))?\)', oracle_type)
            if match:
                precision = int(match.group(1))
                scale = int(match.group(2)) if match.group(2) else 0
                
                if scale == 0:
                    if precision <= 4:
                        return 'SMALLINT'
                    elif precision <= 9:
                        return 'INTEGER'
                    elif precision <= 18:
                        return 'BIGINT'
                    else:
                        return f'NUMERIC({precision})'
                else:
                    return f'NUMERIC({precision},{scale})'
            else:
                return 'NUMERIC'
        else:
            return 'NUMERIC'
    
    # VARCHAR2 mappings
    if oracle_type.startswith('VARCHAR2'):
        match = re.search(r'VARCHAR2\((\d+)\)', oracle_type)
        if match:
            length = match.group(1)
            return f'VARCHAR({length})'
        else:
            return 'TEXT'
    
    # FLOAT mappings
    if oracle_type.startswith('FLOAT'):
        match = re.search(r'FLOAT\((\d+)\)', oracle_type)
        if match:
            precision = int(match.group(1))
            if precision <= 24:
                return 'REAL'
            else:
                return 'DOUBLE PRECISION'
        else:
            return 'DOUBLE PRECISION'
    
    # RAW mappings (Oracle binary data)
    if oracle_type.startswith('RAW'):
        match = re.search(r'RAW\((\d+)\)', oracle_type)
        if match:
            length = int(match.group(1))
            if length == 16:
                return 'UUID'  # PostgreSQL native UUID type
            else:
                return 'BYTEA'
        else:
            return 'BYTEA'
    
    # Date mappings
    if oracle_type == 'DATE':
        return 'TIMESTAMP'
    
    # CHAR mappings
    if oracle_type.startswith('CHAR'):
        match = re.search(r'CHAR\((\d+)\)', oracle_type)
        if match:
            length = match.group(1)
            return f'CHAR({length})'
        else:
            return 'CHAR(1)'
    
    # Default fallback
    type_mappings = {
        'CLOB': 'TEXT',
        'BLOB': 'BYTEA',
        'RAW': 'BYTEA',
        'LONG': 'TEXT',
        'ROWID': 'VARCHAR(18)',
        'UROWID': 'VARCHAR(4000)',
        'TIMESTAMP(6)': 'TIMESTAMP(6)',
        'BINARY_FLOAT': 'REAL',
        'BINARY_DOUBLE': 'DOUBLE PRECISION'
    }
    
    return type_mappings.get(oracle_type, oracle_type)

def parse_table_definition(table_text: str) -> Tuple[str, List[Tuple[str, str]]]:
    """Parse a table definition from Oracle text format"""
    lines = table_text.strip().split('\n')
    
    # Extract table name from first line
    table_name_line = lines[0]
    table_name = table_name_line.replace('TABLE:', '').strip()
    
    columns = []
    for line in lines[1:]:
        line = line.strip()
        if not line:
            continue
            
        # Skip header lines (contain "Column", "Null?", "Type", or dashes)
        if ('Column' in line and 'Null?' in line and 'Type' in line) or \
           line.startswith('-') or \
           line == '' or \
           line.startswith('Column'):
            continue
            
        # Split column name and type - handle different formats
        if line.count(' ') >= 2:
            # Format: COLUMN_NAME    [NOT] NULL    TYPE
            parts = line.split()
            column_name = parts[0]
            
            # Find the type (last non-null-related part)
            if 'NOT' in parts and 'NULL' in parts:
                # Skip NOT NULL
                type_parts = []
                for part in parts[1:]:
                    if part not in ['NOT', 'NULL']:
                        type_parts.append(part)
                column_type = ' '.join(type_parts)
            elif 'NULL' in parts:
                # Skip NULL
                type_parts = []
                for part in parts[1:]:
                    if part != 'NULL':
                        type_parts.append(part)
                column_type = ' '.join(type_parts)
            else:
                # No NULL info, everything after first part is type
                column_type = ' '.join(parts[1:])
                
            if column_type:
                columns.append((column_name, column_type))
        else:
            # Simple format: COLUMN_NAME TYPE
            parts = line.split(None, 1)
            if len(parts) >= 2:
                column_name = parts[0]
                column_type = parts[1]
                columns.append((column_name, column_type))
    
    return table_name, columns

def generate_postgres_ddl(table_name: str, columns: List[Tuple[str, str]]) -> str:
    """Generate PostgreSQL DDL for a table"""
    ddl_lines = [f'CREATE TABLE IF NOT EXISTS {table_name} (']
    
    column_definitions = []
    for column_name, oracle_type in columns:
        postgres_type = oracle_to_postgres_type(oracle_type)
        column_definitions.append(f'    {column_name} {postgres_type}')
    
    ddl_lines.append(',\n'.join(column_definitions))
    ddl_lines.append(');')
    ddl_lines.append('')  # Empty line after table
    
    return '\n'.join(ddl_lines)

def convert_schema_file(input_file: str, output_file: str, schema_name: str):
    """Convert an Oracle schema file to PostgreSQL DDL"""
    try:
        with open(input_file, 'r') as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: Input file '{input_file}' not found")
        return False
    
    # Split into table definitions
    table_sections = content.split('\n\n')
    
    ddl_output = []
    ddl_output.append(f'-- {schema_name} Schema - PostgreSQL DDL')
    ddl_output.append(f'-- Converted from Oracle schema definition')
    ddl_output.append(f'-- Generated on: {__import__("datetime").datetime.now().strftime("%Y-%m-%d %H:%M:%S")}')
    ddl_output.append('')
    ddl_output.append('-- Drop existing tables (optional)')
    ddl_output.append('-- DROP SCHEMA IF EXISTS schema_name CASCADE;')
    ddl_output.append('-- CREATE SCHEMA schema_name;')
    ddl_output.append('')
    
    tables_processed = 0
    
    for section in table_sections:
        section = section.strip()
        if not section or 'TABLE:' not in section:
            continue
            
        try:
            table_name, columns = parse_table_definition(section)
            if columns:  # Only process tables with columns
                postgres_ddl = generate_postgres_ddl(table_name, columns)
                ddl_output.append(postgres_ddl)
                tables_processed += 1
                print(f"✅ Converted table: {table_name} ({len(columns)} columns)")
        except Exception as e:
            print(f"⚠️  Warning: Failed to process table section: {e}")
            continue
    
    # Write output file
    try:
        with open(output_file, 'w') as f:
            f.write('\n'.join(ddl_output))
        print(f"✅ Successfully wrote {tables_processed} tables to: {output_file}")
        return True
    except Exception as e:
        print(f"❌ Error writing output file: {e}")
        return False

def main():
    """Main conversion function"""
    print("🔄 Oracle to PostgreSQL Schema Converter")
    print("========================================")
    
    # Convert Legacy schema
    print("\n📚 Converting Legacy Schema...")
    legacy_success = convert_schema_file(
        'Legacy_tables.txt',
        'aws/legacy_schema.sql',
        'Legacy'
    )
    
    # Convert NDC PLUS schema  
    print("\n🚀 Converting NDC PLUS Schema...")
    ndc_success = convert_schema_file(
        'NDC_PLUS_tables.txt', 
        'aws/ndc_plus_schema.sql',
        'NDC PLUS'
    )
    
    print("\n📋 Conversion Summary:")
    print("=====================")
    print(f"Legacy Schema: {'✅ Success' if legacy_success else '❌ Failed'}")
    print(f"NDC PLUS Schema: {'✅ Success' if ndc_success else '❌ Failed'}")
    
    if legacy_success and ndc_success:
        print("\n🎉 All schemas converted successfully!")
        print("📁 Output files:")
        print("   • aws/legacy_schema.sql")
        print("   • aws/ndc_plus_schema.sql")
        print("\n⏭️  Next step: Run './aws/deploy-databases.sh' to create AWS RDS instances")
        return True
    else:
        print("\n❌ Some conversions failed. Please check the errors above.")
        return False

if __name__ == '__main__':
    success = main()
    sys.exit(0 if success else 1)