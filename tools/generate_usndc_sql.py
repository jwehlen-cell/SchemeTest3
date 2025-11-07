#!/usr/bin/env python3
"""
USNDC PostgreSQL Schema Generator

Generates PostgreSQL-compatible schema SQL from USNDC_tables.txt with:
- Proper data type mapping from Oracle to PostgreSQL
- Primary key constraints
- Foreign key relationships based on column analysis
- Indexes for performance
- Comments for documentation
"""

import re
from pathlib import Path
from collections import defaultdict


def parse_usndc_tables(filepath):
    """Parse USNDC_tables.txt file."""
    
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


def map_oracle_to_postgresql(oracle_type):
    """Map Oracle data types to PostgreSQL equivalents."""
    
    oracle_type = oracle_type.upper()
    
    # Number types
    if oracle_type.startswith('NUMBER'):
        # Extract precision and scale if specified
        match = re.match(r'NUMBER\((\d+)(?:,(\d+))?\)', oracle_type)
        if match:
            precision = int(match.group(1))
            scale = int(match.group(2)) if match.group(2) else 0
            
            if scale == 0:
                # Integer types
                if precision <= 4:
                    return 'SMALLINT'
                elif precision <= 9:
                    return 'INTEGER'
                elif precision <= 18:
                    return 'BIGINT'
                else:
                    return f'NUMERIC({precision})'
            else:
                # Decimal types
                return f'NUMERIC({precision},{scale})'
        else:
            return 'NUMERIC'
    
    # Float types
    elif oracle_type.startswith('FLOAT'):
        match = re.match(r'FLOAT\((\d+)\)', oracle_type)
        if match:
            precision = int(match.group(1))
            if precision <= 24:
                return 'REAL'
            else:
                return 'DOUBLE PRECISION'
        return 'DOUBLE PRECISION'
    
    # Character types
    elif oracle_type.startswith('VARCHAR2'):
        match = re.match(r'VARCHAR2\((\d+)\)', oracle_type)
        if match:
            length = int(match.group(1))
            return f'VARCHAR({length})'
        return 'TEXT'
    
    elif oracle_type.startswith('CHAR'):
        match = re.match(r'CHAR\((\d+)\)', oracle_type)
        if match:
            length = int(match.group(1))
            return f'CHAR({length})'
        return 'CHAR(1)'
    
    elif oracle_type in ['CLOB', 'LONG']:
        return 'TEXT'
    
    # Date/Time types
    elif oracle_type.startswith('DATE'):
        return 'TIMESTAMP'
    
    elif oracle_type.startswith('TIMESTAMP'):
        return 'TIMESTAMP'
    
    # Binary types
    elif oracle_type.startswith('RAW'):
        return 'BYTEA'
    
    elif oracle_type.startswith('BLOB'):
        return 'BYTEA'
    
    # Default fallback
    else:
        return 'TEXT'


def identify_primary_keys(tables):
    """Identify primary keys and constraints."""
    
    primary_keys = {}
    
    # Define known primary key patterns for seismic tables
    known_pk_patterns = {
        # Core seismic tables
        'EVENT': ['EVID'],
        'ORIGIN': ['ORID'],
        'ARRIVAL': ['ARID'],
        'ASSOC': ['ARID', 'ORID'],  # Composite key
        'AMPLITUDE': ['AMPID'],
        'NETMAG': ['MAGID'],
        'STAMAG': ['MAGID'],
        'WFDISC': ['WFID'],
        'WFTAG': ['TAGID', 'WFID'],
        
        # Station/Network tables
        'SITE': ['STA', 'ONDATE'],
        'SITECHAN': ['STA', 'CHAN', 'ONDATE'],
        'AFFILIATION': ['NET', 'STA', 'TIME'],
        'SENSOR': ['STA', 'CHAN', 'TIME', 'ENDTIME'],
        'INSTRUMENT': ['INID'],
        
        # Administrative tables
        'REMARK': ['COMMID'],
        'TIMESTAMP': ['STA'],
        
        # Processing tables
        'DETECTION': ['DETID'],
        'FILTER': ['FILTERID'],
        'ALGORITHM': ['ALGORITHM_ID'],
        'PROCESS_TRACKING': ['PROCESSID'],
        
        # Quality control
        'QCMASKDEF': ['MASKID'],
        'QCMASKINFO': ['MASKID'],
        
        # User/Security tables
        'DATAUSER': ['USERNAME'],
        'USER_PRIVILEGES': ['USERNAME', 'PRIVILEGE'],
        
        # Event control
        'EVENT_CONTROL': ['EVID'],
        'EVENT_CORRELATION': ['EVID1', 'EVID2'],
        'ORIGIN_TAG': ['ORID', 'TAGNAME'],
        'ARRIVAL_TAG': ['ARID', 'TAGNAME'],
        
        # Dynamic parameters
        'AMPLITUDE_DYN_PARS_INT': ['AMPID', 'PARAMETER_NAME'],
        'AMPLITUDE_DYN_PARS_DBL': ['AMPID', 'PARAMETER_NAME'],
        'AMPLITUDE_DYN_PARS_STR': ['AMPID', 'PARAMETER_NAME'],
        'ARRIVAL_DYN_PARS_INT': ['ARID', 'PARAMETER_NAME'],
        'ARRIVAL_DYN_PARS_DBL': ['ARID', 'PARAMETER_NAME'],
        'ARRIVAL_DYN_PARS_STR': ['ARID', 'PARAMETER_NAME'],
    }
    
    for table_name, table_info in tables.items():
        pk_columns = []
        
        # First check for explicitly marked primary keys
        explicit_pks = [col['name'] for col in table_info['columns'] if col.get('primary_key', False)]
        if explicit_pks:
            pk_columns = explicit_pks
        
        # Check known patterns
        elif table_name in known_pk_patterns:
            potential_pks = known_pk_patterns[table_name]
            # Verify the columns exist in the table
            table_columns = [col['name'] for col in table_info['columns']]
            pk_columns = [pk for pk in potential_pks if pk in table_columns]
        
        # If still no PKs, try to infer
        if not pk_columns:
            table_columns = [col['name'] for col in table_info['columns']]
            
            # Look for single ID columns
            single_id_candidates = [
                col['name'] for col in table_info['columns'] 
                if (col['name'].endswith('ID') or col['name'] in ['EVID', 'ORID', 'ARID', 'WFID', 'MAGID']) 
                and not col['nullable']
            ]
            
            if len(single_id_candidates) == 1:
                pk_columns = single_id_candidates
            elif 'EVID' in table_columns and table_name.startswith('EVENT'):
                pk_columns = ['EVID']
            elif 'ORID' in table_columns and table_name.startswith('ORIGIN'):
                pk_columns = ['ORID']
            elif 'ARID' in table_columns and table_name.startswith('ARRIVAL'):
                pk_columns = ['ARID']
            else:
                # For tables without clear single PKs, create composite key from first few non-nullable columns
                non_nullable_cols = [col['name'] for col in table_info['columns'] if not col['nullable']][:3]
                if non_nullable_cols:
                    pk_columns = non_nullable_cols[:2]  # Limit to 2 columns for composite keys
        
        if pk_columns:
            primary_keys[table_name] = pk_columns
    
    return primary_keys


def identify_foreign_keys(tables):
    """Identify foreign key relationships based on column names and patterns."""
    
    foreign_keys = []
    
    # Create a mapping of potential key columns
    key_columns = {}
    for table_name, table_info in tables.items():
        for col in table_info['columns']:
            col_name = col['name']
            if col_name not in key_columns:
                key_columns[col_name] = []
            key_columns[col_name].append(table_name)
    
    # Identify foreign key relationships
    for table_name, table_info in tables.items():
        for col in table_info['columns']:
            col_name = col['name']
            
            # Skip if this column appears in only one table
            if len(key_columns.get(col_name, [])) <= 1:
                continue
            
            # Look for FK patterns
            potential_fks = []
            
            # Pattern 1: Column appears in multiple tables, could be FK
            for other_table in key_columns[col_name]:
                if other_table != table_name:
                    potential_fks.append(other_table)
            
            # Filter to most likely FK relationships
            for ref_table in potential_fks:
                # Avoid self-references for now (can be complex)
                if ref_table == table_name:
                    continue
                
                # Common FK patterns in seismic data
                if (col_name in ['EVID', 'ORID', 'ARID', 'WFID'] or 
                    col_name.endswith('_ID') or
                    col_name in ['STA', 'NET', 'CHAN']):
                    
                    foreign_keys.append({
                        'table': table_name,
                        'column': col_name,
                        'ref_table': ref_table,
                        'ref_column': col_name,
                        'constraint_name': f'fk_{table_name.lower()}_{col_name.lower()}'
                    })
                    break  # Only add one FK per column
    
    return foreign_keys


def generate_create_tables_sql(tables, primary_keys):
    """Generate CREATE TABLE statements."""
    
    sql_statements = []
    
    sql_statements.append("-- USNDC Database Schema for PostgreSQL")
    sql_statements.append("-- Generated from USNDC_Tables_A_to_Z.html")
    sql_statements.append("-- Compatible with AWS RDS PostgreSQL")
    sql_statements.append("")
    sql_statements.append("-- Drop existing tables (in dependency order)")
    
    # Add DROP statements (reverse order to handle dependencies)
    for table_name in reversed(sorted(tables.keys())):
        sql_statements.append(f"DROP TABLE IF EXISTS {table_name} CASCADE;")
    
    sql_statements.append("")
    sql_statements.append("-- Create tables")
    sql_statements.append("")
    
    # Generate CREATE TABLE statements
    for table_name, table_info in sorted(tables.items()):
        sql_statements.append(f"-- {table_info['description']}")
        sql_statements.append(f"CREATE TABLE {table_name} (")
        
        column_definitions = []
        
        for col in table_info['columns']:
            pg_type = map_oracle_to_postgresql(col['type'])
            null_constraint = "" if col['nullable'] else " NOT NULL"
            
            col_def = f"    {col['name']} {pg_type}{null_constraint}"
            
            if col['comment']:
                col_def += f" -- {col['comment']}"
            
            column_definitions.append(col_def)
        
        # Add primary key constraint
        if table_name in primary_keys:
            pk_cols = ', '.join(primary_keys[table_name])
            column_definitions.append(f"    CONSTRAINT pk_{table_name.lower()} PRIMARY KEY ({pk_cols})")
        
        sql_statements.append(',\n'.join(column_definitions))
        sql_statements.append(");")
        sql_statements.append("")
        
        # Add table comment
        escaped_description = table_info['description'].replace("'", "''")
        sql_statements.append(f"COMMENT ON TABLE {table_name} IS '{escaped_description}';")
        sql_statements.append("")
    
    return sql_statements


def generate_foreign_keys_sql(foreign_keys):
    """Generate ALTER TABLE statements for foreign keys."""
    
    sql_statements = []
    sql_statements.append("-- Add Foreign Key Constraints")
    sql_statements.append("")
    
    for fk in foreign_keys:
        sql_statements.append(
            f"ALTER TABLE {fk['table']} "
            f"ADD CONSTRAINT {fk['constraint_name']} "
            f"FOREIGN KEY ({fk['column']}) "
            f"REFERENCES {fk['ref_table']} ({fk['ref_column']});"
        )
    
    return sql_statements


def generate_indexes_sql(tables, primary_keys, foreign_keys):
    """Generate CREATE INDEX statements for performance."""
    
    sql_statements = []
    sql_statements.append("")
    sql_statements.append("-- Create Indexes for Performance")
    sql_statements.append("")
    
    # Index foreign key columns
    for fk in foreign_keys:
        if fk['table'] not in primary_keys or fk['column'] not in primary_keys[fk['table']]:
            index_name = f"idx_{fk['table'].lower()}_{fk['column'].lower()}"
            sql_statements.append(
                f"CREATE INDEX {index_name} ON {fk['table']} ({fk['column']});"
            )
    
    # Index common query columns
    common_index_columns = ['TIME', 'ENDTIME', 'LDDATE', 'STA', 'NET', 'CHAN', 'PHASE']
    
    for table_name, table_info in tables.items():
        for col in table_info['columns']:
            if col['name'] in common_index_columns:
                # Skip if already part of primary key
                if table_name in primary_keys and col['name'] in primary_keys[table_name]:
                    continue
                
                index_name = f"idx_{table_name.lower()}_{col['name'].lower()}"
                sql_statements.append(
                    f"CREATE INDEX {index_name} ON {table_name} ({col['name']});"
                )
    
    return sql_statements


def main():
    """Main execution function."""
    print("🔍 USNDC PostgreSQL Schema Generator\n")
    
    # Paths
    base_dir = Path(__file__).parent.parent
    usndc_file = base_dir / 'USNDC_tables.txt'
    output_dir = base_dir / 'aws'
    output_file = output_dir / 'usndc_schema.sql'
    
    if not usndc_file.exists():
        print(f"❌ USNDC tables file not found: {usndc_file}")
        return
    
    # Parse tables
    print(f"📄 Parsing {usndc_file.name}...")
    tables = parse_usndc_tables(usndc_file)
    print(f"✓ Found {len(tables)} tables")
    
    # Identify constraints
    print("🔑 Identifying primary keys...")
    primary_keys = identify_primary_keys(tables)
    print(f"✓ Found {len(primary_keys)} primary key constraints")
    
    print("🔗 Identifying foreign keys...")
    foreign_keys = identify_foreign_keys(tables)
    print(f"✓ Found {len(foreign_keys)} foreign key relationships")
    
    # Generate SQL
    print("📝 Generating PostgreSQL schema...")
    
    sql_statements = []
    
    # Table creation
    sql_statements.extend(generate_create_tables_sql(tables, primary_keys))
    
    # Foreign keys (added after tables to avoid dependency issues)
    sql_statements.extend(generate_foreign_keys_sql(foreign_keys))
    
    # Indexes
    sql_statements.extend(generate_indexes_sql(tables, primary_keys, foreign_keys))
    
    # Write to file
    output_dir.mkdir(exist_ok=True)
    with open(output_file, 'w') as f:
        f.write('\n'.join(sql_statements))
    
    print(f"✅ PostgreSQL schema generated: {output_file}")
    print(f"   Tables: {len(tables)}")
    print(f"   Primary Keys: {len(primary_keys)}")
    print(f"   Foreign Keys: {len(foreign_keys)}")
    
    # Generate summary
    total_columns = sum(len(table_info['columns']) for table_info in tables.values())
    print(f"   Total Columns: {total_columns}")


if __name__ == "__main__":
    main()