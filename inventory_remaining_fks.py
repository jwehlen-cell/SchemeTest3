#!/usr/bin/env python3
"""
Inventory remaining missing foreign keys by comparing expected (from oracle_foreign_keys.sql)
vs actual in the database. Print actionable list.
"""

import oracledb
import re

def connect():
    return oracledb.connect(
        user="oracleadmin",
        password="OracleTest2024!",
        host="usndc-oracle-db.c0320kayk04f.us-east-1.rds.amazonaws.com",
        port=1521,
        service_name="ORCL",
    )


def load_expected():
    fks = []
    with open('oracle_foreign_keys.sql', 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            m = re.search(r'ALTER TABLE (\w+) ADD CONSTRAINT (\w+) FOREIGN KEY \(([^\)]+)\) REFERENCES (\w+) \(([^\)]+)\)', line)
            if m:
                fks.append((m.group(2), m.group(1), m.group(3), m.group(4), m.group(5)))
    return fks


def fetch_actual(cur):
    cur.execute("""
        SELECT c.constraint_name, c.table_name, LISTAGG(cc.column_name, ',') WITHIN GROUP (ORDER BY cc.position) cols,
               r.table_name parent_table,
               (SELECT LISTAGG(rc.column_name, ',') WITHIN GROUP (ORDER BY rc.position)
                FROM user_cons_columns rc WHERE rc.constraint_name = c.r_constraint_name) parent_cols
        FROM user_constraints c
        JOIN user_cons_columns cc ON c.constraint_name = cc.constraint_name
        JOIN user_constraints r ON c.r_constraint_name = r.constraint_name
        WHERE c.constraint_type = 'R'
        GROUP BY c.constraint_name, c.table_name, r.table_name, c.r_constraint_name
    """)
    return set((row[1], row[2], row[3], row[4]) for row in cur.fetchall())


def main():
    conn = connect()
    cur = conn.cursor()

    expected = load_expected()
    actual = fetch_actual(cur)

    missing = []
    for cname, child, child_cols, parent, parent_cols in expected:
        key = (child, child_cols, parent, parent_cols)
        if key not in actual:
            missing.append((cname, child, child_cols, parent, parent_cols))

    print(f"Expected FKs: {len(expected)}")
    print(f"Actual FKs  : {len(actual)}")
    print(f"Missing     : {len(missing)}")

    for m in missing[:25]:
        print("  -", m)

    cur.close()
    conn.close()

if __name__ == '__main__':
    main()
