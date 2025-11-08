#!/usr/bin/env python3
"""
Create simplified USNDC schema SQL - tables first, then constraints
"""

def create_tables_only_sql():
    """Generate SQL with only table creation, no foreign keys."""
    
    # Read the original schema
    with open('/Users/josephwehlen/dev/SchemeTest3/aws/usndc_schema.sql', 'r') as f:
        content = f.read()
    
    lines = content.split('\n')
    tables_sql = []
    in_create_table = False
    current_table = []
    
    for line in lines:
        line_upper = line.upper().strip()
        
        # Skip foreign key constraints and indexes
        if any(keyword in line_upper for keyword in [
            'ALTER TABLE', 'ADD CONSTRAINT', 'FOREIGN KEY', 'REFERENCES',
            'CREATE INDEX', 'FK_', 'ADD FOREIGN KEY'
        ]):
            continue
            
        # Start of CREATE TABLE
        if line_upper.startswith('CREATE TABLE'):
            in_create_table = True
            current_table = [line]
            
        elif in_create_table:
            current_table.append(line)
            
            # End of CREATE TABLE
            if line.strip() == ');':
                in_create_table = False
                tables_sql.extend(current_table)
                tables_sql.append('')
                current_table = []
                
        elif line.startswith('--') or line.startswith('DROP') or not line.strip():
            # Keep comments, drops, and empty lines
            tables_sql.append(line)
    
    return '\n'.join(tables_sql)

if __name__ == '__main__':
    simplified_sql = create_tables_only_sql()
    
    with open('/Users/josephwehlen/dev/SchemeTest3/aws/usndc_tables_only.sql', 'w') as f:
        f.write(simplified_sql)
    
    print("✅ Created simplified schema: usndc_tables_only.sql")
    print("   Tables only, no foreign key constraints")