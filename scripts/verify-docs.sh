#!/usr/bin/env bash
# verify-docs.sh — consistency check for token-aware product docs.
#
# Validates that the backlog index, the status sub-folders, and task-card
# frontmatter agree with each other, so the orchestrator never selects work
# from a stale index or a mis-filed card.
#
# Usage:
#   scripts/verify-docs.sh [PRODUCT_DOCS_ROOT]
#
# PRODUCT_DOCS_ROOT defaults to ".". It must be a directory that contains
# docs/product/backlog/. Run it in the meta-repo against an example, or inside
# a configured target repo before the delivery loop selects a task.
#
# Exit code: 0 if no ERRORs, 1 otherwise. WARNs never fail the run.

set -euo pipefail

root="${1:-.}"
backlog="$root/docs/product/backlog"
index="$backlog/index.md"

errors=0
warns=0

err()  { printf 'ERROR: %s\n' "$1"; errors=$((errors + 1)); }
warn() { printf 'WARN:  %s\n' "$1"; warns=$((warns + 1)); }
ok()   { printf 'OK:    %s\n' "$1"; }

if [ ! -d "$backlog" ]; then
  err "no backlog directory at $backlog"
  echo "Summary: $errors error(s), $warns warning(s)."
  exit 1
fi

# Read a scalar frontmatter field (first match) from a markdown file.
# frontmatter is the block between the first two '---' lines.
fm() { # fm <file> <field>
  awk -v field="$2" '
    NR==1 && $0=="---" { infm=1; next }
    infm && $0=="---" { exit }
    infm {
      if ($0 ~ "^"field":") {
        sub("^"field":[[:space:]]*", "")
        gsub(/^[[:space:]]+|[[:space:]]+$/, "")
        print
        exit
      }
    }
  ' "$1"
}

# All known task IDs across every bucket (for dependency resolution).
all_ids=""
while IFS= read -r f; do
  id="$(fm "$f" id)"
  [ -n "$id" ] && all_ids="$all_ids $id"
done < <(find "$backlog/tasks" -type f -name '*.md' 2>/dev/null)

has_id() { case " $all_ids " in *" $1 "*) return 0;; *) return 1;; esac; }

# --- Check 1: bucket folder <-> frontmatter status ----------------------------
check_bucket() { # check_bucket <subdir> <expected-status-regex> <label>
  local dir="$backlog/tasks/$1" expected="$2"
  [ -d "$dir" ] || return 0
  while IFS= read -r f; do
    local st; st="$(fm "$f" status)"
    if [ -z "$st" ]; then
      err "$f: missing 'status' in frontmatter"
    elif ! printf '%s' "$st" | grep -Eq "^($expected)$"; then
      err "$f: in $1/ but status='$st' (expected $expected)"
    fi
  done < <(find "$dir" -type f -name '*.md')
}

check_bucket ready       "ready"             "ready"
check_bucket in-progress "in_progress|review" "in-progress"
check_bucket blocked     "blocked"           "blocked"
check_bucket deferred    "deferred"          "deferred"
check_bucket done        "done"              "done"

# --- Check 2 & 3: backlog index <-> ready/ files ------------------------------
index_ready_ids=""
if [ -f "$index" ]; then
  # Ready-table rows look like: | TASK-001 | ... | tasks/ready/<file>.md |
  while IFS= read -r line; do
    id="$(printf '%s' "$line" | awk -F'|' '{gsub(/^[ \t]+|[ \t]+$/,"",$2); print $2}')"
    file="$(printf '%s' "$line" | awk -F'|' '{f=$(NF-1); gsub(/^[ \t]+|[ \t]+$/,"",f); print f}')"
    [ -z "$id" ] && continue
    index_ready_ids="$index_ready_ids $id"
    # Check 3: referenced file resolves (path is relative to backlog/).
    if [ -n "$file" ] && [ ! -f "$backlog/$file" ]; then
      err "index lists $id with file '$file' that does not exist under $backlog/"
    fi
    # Check 2a: indexed ready task actually lives in ready/.
    if ! find "$backlog/tasks/ready" -type f -name '*.md' 2>/dev/null \
         | xargs grep -lE "^id:[[:space:]]*$id\b" >/dev/null 2>&1; then
      err "index ready-table lists $id but no card with that id is in tasks/ready/"
    fi
  done < <(grep -E '^\|[[:space:]]*TASK-' "$index" || true)
else
  err "no backlog index at $index"
fi

# Check 2b: every ready/ card appears in the index ready-table.
if [ -d "$backlog/tasks/ready" ]; then
  while IFS= read -r f; do
    id="$(fm "$f" id)"
    [ -z "$id" ] && continue
    case " $index_ready_ids " in
      *" $id "*) : ;;
      *) err "$id (in tasks/ready/) is missing from the backlog index ready-table" ;;
    esac
  done < <(find "$backlog/tasks/ready" -type f -name '*.md')
fi

# --- Check 4 & 5: depends_on / epic references resolve (warnings) -------------
while IFS= read -r f; do
  deps="$(fm "$f" depends_on)"
  # inline list form: [TASK-002, TASK-003] or [] or 'none'
  deps="$(printf '%s' "$deps" | tr -d '[]' | tr ',' ' ')"
  for d in $deps; do
    case "$d" in
      TASK-*) has_id "$d" || warn "$f: depends_on '$d' does not resolve to a known task";;
    esac
  done
  epic="$(fm "$f" epic)"
  case "$epic" in
    EPIC-*)
      if ! find "$backlog/epics" -type f -name "*$epic*" 2>/dev/null | grep -q .; then
        warn "$f: epic '$epic' has no matching card under epics/"
      fi
      ;;
  esac
done < <(find "$backlog/tasks" -type f -name '*.md' 2>/dev/null)

# --- Summary ------------------------------------------------------------------
[ "$errors" -eq 0 ] && ok "backlog docs are consistent"
echo "Summary: $errors error(s), $warns warning(s)."
[ "$errors" -eq 0 ]
