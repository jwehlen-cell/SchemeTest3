#!/bin/bash
set -euo pipefail

SRC=${1:-"deploy-live/evid-arid-orid.mmd"}
OUT=${2:-"deploy-live/er/er-mermaid.svg"}

mkdir -p "$(dirname "$OUT")"

if ! command -v npx >/dev/null 2>&1; then
  echo "❌ npx not found (need Node.js/npm)." >&2
  exit 1
fi

echo "🖼️ Rendering Mermaid to SVG"
# Use mermaid-cli (mmdc). If not present, npx will fetch it.
# Limit max width for readability; can adjust with -w
npx -y @mermaid-js/mermaid-cli@10.9.0 -i "$SRC" -o "$OUT" -w 2600 || {
  echo "❌ Mermaid CLI rendering failed" >&2
  exit 1
}

echo "✅ Wrote $OUT"
