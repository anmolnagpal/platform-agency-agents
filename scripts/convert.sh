#!/usr/bin/env bash
# Convert Platform Agency Agents into tool-specific formats.
set -euo pipefail

if [[ -t 1 ]]; then
  GREEN=$'\033[0;32m'; YELLOW=$'\033[1;33m'; RED=$'\033[0;31m'; BOLD=$'\033[1m'; RESET=$'\033[0m'
else
  GREEN=''; YELLOW=''; RED=''; BOLD=''; RESET=''
fi

info() { printf "%s[OK]%s  %s\n" "$GREEN" "$RESET" "$*"; }
error() { printf "%s[ERR]%s %s\n" "$RED" "$RESET" "$*" >&2; }
usage() {
  cat <<'USAGE'
Usage: ./scripts/convert.sh [--tool <name>] [--out <dir>] [--help]
Tools: antigravity, gemini-cli, opencode, cursor, aider, windsurf, claude-code, all (default)
USAGE
  exit 0
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUT_DIR="$REPO_ROOT/integrations"
TODAY="$(date +%Y-%m-%d)"
AGENT_DIRS=(foundation delivery runtime assurance enablement)
TOOL="all"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --tool) TOOL="$2"; shift 2 ;;
    --out) OUT_DIR="$2"; shift 2 ;;
    --help) usage ;;
    *) error "Unknown arg $1"; usage ;;
  esac
done

mkdir -p "$OUT_DIR"
rm -rf "$OUT_DIR"/{antigravity,gemini-cli,opencode,cursor,aider,windsurf,claude-code} 2>/dev/null || true
mkdir -p "$OUT_DIR"/{antigravity,gemini-cli,opencode,cursor,aider,windsurf,claude-code}

get_field() {
  local field="$1" file="$2"
  awk -v f="$field" '
    /^---$/ { fm++; next }
    fm == 1 && $0 ~ "^" f ": " { sub("^" f ": ", ""); print; exit }
  ' "$file"
}

get_body() {
  awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$1"
}

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

files=()
for dir in "${AGENT_DIRS[@]}"; do
  while IFS= read -r f; do
    files+=("$f")
  done < <(find "$REPO_ROOT/$dir" -maxdepth 1 -name '*.md' -type f | sort)
done

convert_agent() {
  local file="$1"
  local name description color slug body
  name="$(get_field name "$file")"
  description="$(get_field description "$file")"
  color="$(get_field color "$file")"
  slug="$(slugify "$name")"
  body="$(get_body "$file")"

  case "$TOOL" in
    all|antigravity)
      local outdir="$OUT_DIR/antigravity/agency-$slug"
      mkdir -p "$outdir"
      cat > "$outdir/SKILL.md" <<HEREDOC
---
name: agency-$slug
description: ${description}
risk: low
source: community
date_added: '$TODAY'
---
${body}
HEREDOC
      ;;
  esac

  case "$TOOL" in
    all|gemini-cli)
      local outdir="$OUT_DIR/gemini-cli/skills/$slug"
      mkdir -p "$outdir"
      cat > "$outdir/SKILL.md" <<HEREDOC
---
name: ${slug}
description: ${description}
---
${body}
HEREDOC
      ;;
  esac

  case "$TOOL" in
    all|opencode)
      mkdir -p "$OUT_DIR/opencode/agent"
      cat > "$OUT_DIR/opencode/agent/${slug}.md" <<HEREDOC
---
name: ${name}
description: ${description}
color: ${color}
---
${body}
HEREDOC
      ;;
  esac

  case "$TOOL" in
    all|cursor)
      mkdir -p "$OUT_DIR/cursor/rules"
      cat > "$OUT_DIR/cursor/rules/${slug}.mdc" <<HEREDOC
---
description: ${description}
globs: ""
alwaysApply: false
---
${body}
HEREDOC
      ;;
  esac

  case "$TOOL" in
    all|claude-code)
      mkdir -p "$OUT_DIR/claude-code"
      cp "$file" "$OUT_DIR/claude-code/${slug}.md"
      ;;
  esac

  case "$TOOL" in
    all|aider)
      mkdir -p "$OUT_DIR/aider"
      {
        echo "# Platform Agency Agents Conventions"
        echo "## ${name}"
        echo "${body}"
        echo "---"
      } >> "$OUT_DIR/aider/CONVENTIONS.md"
      ;;
  esac

  case "$TOOL" in
    all|windsurf)
      mkdir -p "$OUT_DIR/windsurf"
      {
        echo "# ${name}"
        echo "${body}"
        echo "---"
      } >> "$OUT_DIR/windsurf/.windsurfrules"
      ;;
  esac
}

>"$OUT_DIR/aider/CONVENTIONS.md" cat <<'HDR'
# Platform Agency Agents Conventions
HDR
>"$OUT_DIR/windsurf/.windsurfrules" cat <<'HDR'
# Platform Agency Agents Rules
HDR

for f in "${files[@]}"; do
  convert_agent "$f"
done

info "Generated integrations for ${#files[@]} agents"
