#!/usr/bin/env python3
import os
import re
from pathlib import Path

# Scan SchemaSpy table HTML pages to find tables containing EVID, ARID, ORID columns
BASE = Path(__file__).resolve().parents[1] / "deploy-live" / "docs" / "oracle" / "tables"
assert BASE.exists(), f"Tables directory not found: {BASE}"

has = {"EVID": set(), "ARID": set(), "ORID": set()}
all_tables = set()

pattern_span = re.compile(r"<span id=\"(EVID|ARID|ORID)\"\>")
pattern_td = re.compile(r">(EVID|ARID|ORID)<")

for html in sorted(BASE.glob("*.html")):
    tname = html.stem
    all_tables.add(tname)
    try:
        text = html.read_text(encoding="utf-8", errors="ignore")
    except Exception:
        continue
    # Prefer span-id markers; fallback to plain cell text
    ids = set(m.group(1) for m in pattern_span.finditer(text))
    if not ids:
        ids = set(m.group(1) for m in pattern_td.finditer(text))
    for k in ("EVID", "ARID", "ORID"):
        if k in ids:
            has[k].add(tname)

# Ensure canonical anchor entities exist (EVENT, ARRIVAL, ORIGIN)
anchors = {
    "EVID": "EVENT",
    "ARID": "ARRIVAL",
    "ORID": "ORIGIN",
}

# Prepare Mermaid ER content
lines = []
lines.append("erDiagram")

# Define anchor entities with their key
lines.append("  EVENT {\n    NUMBER evid PK\n  }")
lines.append("  ARRIVAL {\n    NUMBER arid PK\n  }")
lines.append("  ORIGIN {\n    NUMBER orid PK\n  }")

# For each table referencing these ids, create entity and relationship
# Use }o--|| to indicate many-to-one (optional to mandatory)

def sanitize(name: str) -> str:
    # Mermaid entities cannot contain spaces or hyphens; keep uppercase underscores
    return re.sub(r"[^A-Za-z0-9_]", "_", name)

seen_entities = set(["EVENT", "ARRIVAL", "ORIGIN"])  # already declared

for key, anchor in anchors.items():
    for tbl in sorted(has[key]):
        ent = sanitize(tbl)
        if ent not in seen_entities:
            # Give the entity the column for context
            col = key.lower()
            lines.append(f"  {ent} {{\n    NUMBER {col}\n  }}")
            seen_entities.add(ent)
        rel_label = key  # EVID/ARID/ORID
        # Avoid self-link duplicates if tbl equals anchor table; still can show link from ORIGIN->EVENT via EVID if exists
        if ent != anchor:
            lines.append(f"  {ent} }}o--|| {anchor} : \"{rel_label}\"")

# Write outputs
out_dir = Path(__file__).resolve().parents[1] / "deploy-live"
out_dir.mkdir(parents=True, exist_ok=True)

mmd_path = out_dir / "evid-arid-orid.mmd"
mmd_path.write_text("\n".join(lines), encoding="utf-8")
print(f"Wrote Mermaid ER to {mmd_path}")
