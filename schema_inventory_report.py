#!/usr/bin/env python3
"""Comprehensive verification of Oracle schema objects in the current user.

Outputs counts for tables, columns, indexes, and constraints by type, plus
per-table column inventories and a short list of tables missing PKs or with no
constraints. Designed to run safely on the live Oracle RDS.
"""

import oracledb


def connect():
    return oracledb.connect(
        user="oracleadmin",
        password="OracleTest2024!",
        host="usndc-oracle-db.c0320kayk04f.us-east-1.rds.amazonaws.com",
        port=1521,
        service_name="ORCL",
    )


def fetch_counts(cur):
    cur.execute("SELECT COUNT(*) FROM user_tables WHERE table_name NOT LIKE 'BIN$%'")
    tables = cur.fetchone()[0]

    cur.execute(
        """
        SELECT constraint_type, COUNT(*)
        FROM user_constraints
        WHERE constraint_name NOT LIKE 'BIN$%'
        GROUP BY constraint_type
        """
    )
    constraints = dict(cur.fetchall())

    cur.execute(
        """
        SELECT COUNT(*)
        FROM user_tab_columns
        WHERE table_name NOT LIKE 'BIN$%'
        """
    )
    columns = cur.fetchone()[0]

    cur.execute(
        """
        SELECT COUNT(*)
        FROM user_indexes
        WHERE index_name NOT LIKE 'BIN$%'
        """
    )
    indexes = cur.fetchone()[0]

    return tables, columns, indexes, constraints


def list_tables_without_pk(cur):
    cur.execute(
        """
        SELECT t.table_name
        FROM user_tables t
        WHERE NOT EXISTS (
            SELECT 1 FROM user_constraints c
            WHERE c.table_name = t.table_name AND c.constraint_type = 'P'
        )
        ORDER BY t.table_name
        """
    )
    return [r[0] for r in cur.fetchall()]


def list_tables_with_no_constraints(cur):
    cur.execute(
        """
        SELECT t.table_name
        FROM user_tables t
        WHERE NOT EXISTS (
            SELECT 1 FROM user_constraints c WHERE c.table_name = t.table_name
        )
        ORDER BY t.table_name
        """
    )
    return [r[0] for r in cur.fetchall()]


def sample_columns(cur, limit=10):
    cur.execute(
        f"""
        SELECT table_name
        FROM user_tables
        WHERE table_name NOT LIKE 'BIN$%'
        ORDER BY table_name FETCH FIRST {limit} ROWS ONLY
        """
    )
    tables = [r[0] for r in cur.fetchall()]

    listing = []
    for t in tables:
        cur.execute(
            """
            SELECT column_name, data_type, data_length
            FROM user_tab_columns
            WHERE table_name = :t
            ORDER BY column_id
            """,
            t=t,
        )
        cols = [f"{r[0]} {r[1]}({r[2]})" if r[1] in ("CHAR", "VARCHAR2", "NCHAR", "NVARCHAR2") else f"{r[0]} {r[1]}" for r in cur.fetchall()]
        listing.append((t, cols))
    return listing


def main():
    print("🔎 Schema inventory report (Oracle)")
    conn = connect()
    cur = conn.cursor()

    tables, columns, indexes, constraints = fetch_counts(cur)
    print(f"Tables: {tables}")
    print(f"Columns: {columns}")
    print(f"Indexes: {indexes}")
    print("Constraints:")
    for k in sorted(constraints):
        label = {"P": "Primary", "U": "Unique", "R": "Foreign", "C": "Check"}.get(k, k)
        print(f"  {label}: {constraints[k]}")

    without_pk = list_tables_without_pk(cur)
    if without_pk:
        print(f"\nTables without a Primary Key ({len(without_pk)}):")
        print("  " + ", ".join(without_pk[:10]) + (" ..." if len(without_pk) > 10 else ""))

    no_cons = list_tables_with_no_constraints(cur)
    if no_cons:
        print(f"\nTables with no constraints ({len(no_cons)}):")
        print("  " + ", ".join(no_cons[:10]) + (" ..." if len(no_cons) > 10 else ""))

    print("\nTable-specific notes:")
    # Show constraints on well-known tables lacking PK by design
    for t in ("WFDISC", "REMAP"):
        cur.execute(
            """
            SELECT constraint_name, constraint_type
            FROM user_constraints
            WHERE table_name = :t
            ORDER BY constraint_type, constraint_name
            """,
            t=t,
        )
        cons = [f"{r[0]}({r[1]})" for r in cur.fetchall()]
        print(f"  {t} constraints: {', '.join(cons) if cons else 'none'}")

    print("\nSample columns:")
    for t, cols in sample_columns(cur, limit=8):
        print(f"  {t}: {', '.join(cols[:6])}{' ...' if len(cols) > 6 else ''}")

    cur.close()
    conn.close()
    print("\n✅ Verification complete.")


if __name__ == "__main__":
    main()
