#!/usr/bin/env python3
"""Export all current foreign key constraints from the connected Oracle schema
into a normalized SQL file `oracle_foreign_keys_clean.sql`.

Uses USER_CONSTRAINTS / USER_CONS_COLUMNS to reconstruct ordered column lists
for both child and parent constraints. Output is sorted for stable diffs.
"""

import oracledb
from pathlib import Path

OUTPUT_FILE = Path("oracle_foreign_keys_clean.sql")


def connect():
    return oracledb.connect(
        user="oracleadmin",
        password="OracleTest2024!",
        host="usndc-oracle-db.c0320kayk04f.us-east-1.rds.amazonaws.com",
        port=1521,
        service_name="ORCL",
    )


def fetch_foreign_keys(cur):
    cur.execute(
        """
        SELECT c.constraint_name,
               c.table_name child_table,
               r.table_name parent_table,
               c.r_constraint_name parent_constraint
        FROM user_constraints c
        JOIN user_constraints r ON c.r_constraint_name = r.constraint_name
        WHERE c.constraint_type = 'R'
        ORDER BY c.table_name, c.constraint_name
        """
    )
    rows = cur.fetchall()

    fks = []
    for cname, child_table, parent_table, parent_cname in rows:
        # Child columns ordered
        cur.execute(
            """
            SELECT column_name FROM user_cons_columns
            WHERE constraint_name = :c
            ORDER BY position
            """,
            c=cname,
        )
        child_cols = [r[0] for r in cur.fetchall()]

        # Parent columns ordered
        cur.execute(
            """
            SELECT column_name FROM user_cons_columns
            WHERE constraint_name = :p
            ORDER BY position
            """,
            p=parent_cname,
        )
        parent_cols = [r[0] for r in cur.fetchall()]

        fks.append(
            (
                child_table,
                cname,
                child_cols,
                parent_table,
                parent_cols,
            )
        )
    return fks


def write_sql(fks):
    lines = []
    for child_table, cname, child_cols, parent_table, parent_cols in sorted(
        fks, key=lambda x: (x[0], x[1])
    ):
        lines.append(
            f"ALTER TABLE {child_table} ADD CONSTRAINT {cname} FOREIGN KEY ("
            + ", ".join(child_cols)
            + ") REFERENCES "
            + f"{parent_table} ("
            + ", ".join(parent_cols)
            + ");"
        )
    OUTPUT_FILE.write_text("\n".join(lines) + "\n")
    return OUTPUT_FILE


def main():
    print("🔍 Exporting current foreign keys ...")
    conn = connect()
    cur = conn.cursor()
    fks = fetch_foreign_keys(cur)
    out_file = write_sql(fks)
    print(f"✅ Exported {len(fks)} foreign keys to {out_file}")
    cur.close()
    conn.close()


if __name__ == "__main__":
    main()
