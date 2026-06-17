#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
rm -f ../opus-codex-orchestration-skill.zip
zip -r ../opus-codex-orchestration-skill.zip . -x "*.DS_Store" "*.tmp"
