#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="${ROOT%/}.zip"
cd "$(dirname "$ROOT")"
zip -r "$OUT" "$(basename "$ROOT")" -x "*/.git/*" >/dev/null
echo "$OUT"
