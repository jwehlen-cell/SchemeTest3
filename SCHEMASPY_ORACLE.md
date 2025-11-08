# Oracle SchemaSpy Documentation

This project includes automated generation of SchemaSpy HTML docs for the USNDC Oracle (RDS 19c) schema.

## Contents
- 177 Oracle tables
- 101 foreign keys (normalized with parent-side uniques)
- Relationship diagrams (Graphviz preferred; viz.js fallback if Java >=11)

## Generation

Primary script:
```
bash aws/generate-oracle-docs.sh
```
Outputs to `deploy-live/docs/oracle` and mirrors to `deploy-live/docs/legacy`.

The script auto-downloads:
- SchemaSpy 6.2.4 (`aws/schemaspy.jar`) if missing
- Oracle JDBC driver ojdbc8 19.3.0.0 (`aws/ojdbc8.jar`) if missing

## Graphviz Tuning
You can customize diagram rendering by exporting `GRAPHVIZ_ARGS` before running the script:
```
export GRAPHVIZ_ARGS="-Gfontsize=10 -Nfontsize=9 -Efontsize=8 -Gnodesep=0.35 -Granksep=0.55"
```
Defaults (if unset): `-Gfontsize=10 -Nfontsize=9 -Efontsize=8 -Gnodesep=0.35 -Granksep=0.55`

If Graphviz (`dot`) is installed, static PNG diagrams are generated. If not and Java >=11, the script uses `-vizjs`. If neither is available (Java 8 + no Graphviz), it falls back to `-noviz` (no diagrams).

## Config File (Optional)
You can run SchemaSpy directly with the provided properties file:
```
java -jar aws/schemaspy.jar -configFile aws/schemaspy-oracle.properties
```
Adjust credentials and host in `aws/schemaspy-oracle.properties` if needed.

## Deployment
Deploy directly to the designated S3 website bucket:
```
bash deploy-live/deploy-oracle-site.sh
```
Environment overrides:
- `BUCKET_NAME` (default: `usndc-enhanced-schemaspy-1762554476`)
- `REGION` (default: `us-east-1`)

Resulting site URL pattern:
```
http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com/index.html
```

## Verification Checklist
- `index.html` loads with Oracle card
- `docs/oracle/index.html` renders table list
- Diagrams appear on a large table (e.g. `AMPLITUDE`)
- `docs/oracle/constraints.html` lists foreign keys; count shows 101

## Troubleshooting
| Issue | Cause | Fix |
|-------|-------|-----|
| No diagrams | Graphviz missing & Java <11 | Install Graphviz or upgrade Java |
| `UnsupportedClassVersionError` on viz.js | Java 8 runtime | Install Java 11+ or rely on Graphviz |
| Missing tables | Wrong schema/user | Confirm `ORACLE_SCHEMA` matches actual owner |
| Slow generation | Large schema + diagrams | Reduce `-degree` to 1 or use `-noviz` |

## Next Steps
- Integrate automated nightly regeneration (cron or CI) to track schema drift
- Add diff script to compare live FKs vs. exported authoritative list
- Compress large images with `pngquant` to reduce bandwidth
