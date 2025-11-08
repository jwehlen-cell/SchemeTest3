#!/usr/bin/env python3
"""
Repair the remaining foreign keys by adding composite FKs where needed and
fixing incorrect references. Also add missing unique constraints on parent columns.
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

DDL_UNIQUES = [
    # Ensure parent-side uniqueness exists
    ("CLUSTER_STATION", "CLUSTAID_ACTIVETIME_UK", "UNIQUE (CLUSTAID, ACTIVETIME)"),
    ("CODAMAG_INPUT", "CODAMAG_INPUT_COMPOSITE_UK", "UNIQUE (AMPID, FLO, FHI)"),
    ("MDAC_FI", "MDAC_FI_CORRID_UK", "UNIQUE (CORRID)"),
]

DDL_FKS = [
    # Cluster composite relationships
    ("CLUSTER_MAGREF", "CLU_MAGREF_CLU_STA_CA_AT_FK2", "(CLUSTAID, ACTIVETIME)", "CLUSTER_STATION", "(CLUSTAID, ACTIVETIME)"),
    ("CLUSTER_MEC", "CLU_MEC_CLU_STA_CA_AT_FK2", "(CLUSTAID, ACTIVETIME)", "CLUSTER_STATION", "(CLUSTAID, ACTIVETIME)"),
    ("CLUSTER_ORID", "CLU_ORID_CLU_STA_CA_AT_FK2", "(CLUSTAID, ACTIVETIME)", "CLUSTER_STATION", "(CLUSTAID, ACTIVETIME)"),
    ("CLUSTER_OVERRIDE", "CLU_OVRD_CLU_STA_CA_AT_FK2", "(CLUSTAID, ACTIVETIME)", "CLUSTER_STATION", "(CLUSTAID, ACTIVETIME)"),
    ("CLUSTER_THRESHOLD", "CLU_THRESH_CLU_STA_CA_AT_FK2", "(CLUSTAID, ACTIVETIME)", "CLUSTER_STATION", "(CLUSTAID, ACTIVETIME)"),
    ("STATION_PROCESSING", "STA_PROC_CLU_STA_CA_AT_FK2", "(CLUSTAID, ACTIVETIME)", "CLUSTER_STATION", "(CLUSTAID, ACTIVETIME)"),
    ("SVDDISC", "SVDDISC_CLU_STA_CA_AT_FK2", "(CLUSTAID, ACTIVETIME)", "CLUSTER_STATION", "(CLUSTAID, ACTIVETIME)"),
    ("SVDDISC_CHAN_ORDER", "SVD_CH_ORD_CLU_STA_CA_AT_FK2", "(CLUSTAID, ACTIVETIME)", "CLUSTER_STATION", "(CLUSTAID, ACTIVETIME)"),

    # CODAMAG composite
    ("CODAMAG_OUTPUT", "CODAMAGOUT_CODAMAGIN_COMPOSITE_FK", "(AMPID, FLO, FHI)", "CODAMAG_INPUT", "(AMPID, FLO, FHI)"),

    # Event correlation to correct parent columns
    ("EVENT_CORRELATION", "EVT_CORR_EVT_SRC_EVID_EVID_FK2", "(SOURCE_EVID)", "EVENT", "(EVID)"),
    ("EVENT_CORRELATION", "EVT_CORR_ORIG_SRC_ORID_ORID_FK2", "(SOURCE_ORID)", "ORIGIN", "(ORID)"),

    # Filter group relationships
    ("FILTER_GROUP", "FILTER_GRP_FILT_P_FILTERID_FK2", "(PARENT_FILTERID)", "FILTER", "(FILTERID)"),
    ("FILTER_GROUP", "FILTER_GRP_FILT_C_FILTERID_FK2", "(CHILD_FILTERID)", "FILTER", "(FILTERID)"),

    # SADO*_REPORT_ID relationships
    ("SADO_EMAIL_HISTORY", "SADO_EH_SADO_REP_REPORT_ID_FK2", "(REPORT_ID)", "SADO_REPORT", "(REPORT_ID)"),
    ("SADO_PDF_REPORTS", "SADO_PR_SADO_REP_REPORT_ID_FK2", "(REPORT_ID)", "SADO_REPORT", "(REPORT_ID)"),
    ("SADO_REPORT_LANDMARKS", "SADO_RL_SADO_REP_REPORT_ID_FK2", "(REPORT_ID)", "SADO_REPORT", "(REPORT_ID)"),
    ("SADO_SCREENSHOTS", "SADO_SS_SADO_REP_REPORT_ID_FK2", "(REPORT_ID)", "SADO_REPORT", "(REPORT_ID)"),

    # Remaining relationships observed failing in previous runs
    ("DEFINING_RULES", "DEF_RULES_DEF_OBS_OBS_ID_FK2", "(OBSTYPE_ID)", "DEFINING_OBSTYPES", "(OBSTYPE_ID)"),
    ("FEEDBACK_CATAFFILIATION", "FBCATAFFIL_FB_FEEDBACK_ID_FK2", "(FEEDBACK_ID)", "FEEDBACK", "(FEEDBACK_ID)"),
    ("FEEDBACK_SCREENSHOTS", "FBSCRNSHOTS_FB_FEEDBACK_ID_FK2", "(FEEDBACK_ID)", "FEEDBACK", "(FEEDBACK_ID)"),
    ("HISTORIC_INFO_SHELL", "HIST_SHELL_ALGORITHM_ID_FK2", "(ALGORITHM_ID)", "ALGORITHM", "(ALGORITHM_ID)"),
    # Corrected cylinder relationship (table/column names)
    ("HISTORIC_INFO_STA_PHASE", "HIST_INFO_STA_PHS_CYL_ID_FK3", "(HISTORIC_INFO_CYLINDER_ID)", "HISTORIC_INFO_CYLINDER", "(HISTORIC_INFO_CYLINDER_ID)"),
    # MDAC FD → FI by corridor id
    ("MDAC_FD", "MDAC_FD_MDAC_FI_CORRID_FK2", "(CORRID)", "MDAC_FI", "(CORRID)"),
    # Defining rules → defining values (ensure present)
    ("DEFINING_RULES", "DEF_RULES_DEF_VALS_VAL_ID_FK2", "(VALUE_ID)", "DEFINING_VALUES", "(VALUE_ID)"),
]

CHECKS = {
    # child_table: required child columns (to ensure composite exists before FK)
    "CLUSTER_MAGREF": ["CLUSTAID", "ACTIVETIME"],
    "CLUSTER_MEC": ["CLUSTAID", "ACTIVETIME"],
    "CLUSTER_ORID": ["CLUSTAID", "ACTIVETIME"],
    "CLUSTER_OVERRIDE": ["CLUSTAID", "ACTIVETIME"],
    "CLUSTER_THRESHOLD": ["CLUSTAID", "ACTIVETIME"],
    "STATION_PROCESSING": ["CLUSTAID", "ACTIVETIME"],
    "SVDDISC": ["CLUSTAID", "ACTIVETIME"],
    "SVDDISC_CHAN_ORDER": ["CLUSTAID", "ACTIVETIME"],
    "CODAMAG_OUTPUT": ["AMPID", "FLO", "FHI"],
    "EVENT_CORRELATION": ["SOURCE_EVID", "SOURCE_ORID"],
    "FILTER_GROUP": ["PARENT_FILTERID", "CHILD_FILTERID"],
    "SADO_EMAIL_HISTORY": ["REPORT_ID"],
    "SADO_PDF_REPORTS": ["REPORT_ID"],
    "SADO_REPORT_LANDMARKS": ["REPORT_ID"],
    "SADO_SCREENSHOTS": ["REPORT_ID"],
    "HISTORIC_INFO_STA_PHASE": ["HISTORIC_INFO_CYLINDER_ID"],
}

def table_has_columns(cur, table, cols):
    cur.execute(
        """
        SELECT column_name FROM user_tab_columns
        WHERE table_name = :t
        """,
        t=table,
    )
    have = {r[0] for r in cur.fetchall()}
    return all(c in have for c in cols)


def constraint_exists(cur, name):
    cur.execute(
        "SELECT COUNT(*) FROM user_constraints WHERE constraint_name = :n",
        n=name,
    )
    return cur.fetchone()[0] > 0


def ensure_uniques(conn):
    cur = conn.cursor()
    created = 0
    for table, name, clause in DDL_UNIQUES:
        if not constraint_exists(cur, name):
            try:
                cur.execute(f"ALTER TABLE {table} ADD CONSTRAINT {name} {clause}")
                conn.commit()
                created += 1
            except Exception as e:
                # Ignore if already exists under different name
                conn.rollback()
    cur.close()
    return created


def deploy_repairs(conn):
    cur = conn.cursor()
    ok = 0
    skipped = []
    failed = []
    for child, cname, child_cols, parent, parent_cols in DDL_FKS:
        # Pre-check child columns
        if child in CHECKS and not table_has_columns(cur, child, CHECKS[child]):
            skipped.append((child, cname, "missing child columns"))
            continue
        # Skip if exists
        if constraint_exists(cur, cname):
            continue
        sql = f"ALTER TABLE {child} ADD CONSTRAINT {cname} FOREIGN KEY {child_cols} REFERENCES {parent} {parent_cols}"
        try:
            cur.execute(sql)
            conn.commit()
            ok += 1
        except Exception as e:
            failed.append((child, cname, str(e)))
            conn.rollback()
    cur.close()
    return ok, skipped, failed


def count_foreign_keys(conn):
    cur = conn.cursor()
    cur.execute("SELECT COUNT(*) FROM user_constraints WHERE constraint_type = 'R'")
    n = cur.fetchone()[0]
    cur.close()
    return n


def main():
    print("🚀 Repairing remaining foreign keys...")
    conn = connect()

    created_uniques = ensure_uniques(conn)
    print(f"🔧 Parent-side unique constraints created: {created_uniques}")

    ok, skipped, failed = deploy_repairs(conn)
    print(f"✅ New FKs added: {ok}")
    if skipped:
        print(f"⚠️ Skipped ({len(skipped)}):")
        for s in skipped[:5]:
            print("  -", s)
    if failed:
        print(f"❌ Failed ({len(failed)}):")
        for f in failed[:5]:
            print("  -", f[0], f[1], f[2][:80], "...")

    total_fk = count_foreign_keys(conn)
    print(f"📊 Total foreign keys now: {total_fk}")

    conn.close()

if __name__ == "__main__":
    main()
