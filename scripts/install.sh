#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
INTEGRATIONS="$REPO_ROOT/integrations"
TOOLS=(claude-code antigravity gemini-cli opencode cursor aider windsurf)

usage() {
  echo "Usage: ./scripts/install.sh [--tool <name>] [--no-interactive]"; exit 0
}

TARGETS=()
INTERACTIVE=true

while [[ $# -gt 0 ]]; do
  case "$1" in
    --tool) TARGETS=($2); shift 2 ;;
    --no-interactive) INTERACTIVE=false; shift ;;
    --help) usage ;;
    *) usage ;;
  esac
done

if [[ ! -d "$INTEGRATIONS" ]]; then
  echo "integrations/ missing. Run ./scripts/convert.sh first." >&2
  exit 1
fi

if [[ ${#TARGETS[@]} -eq 0 ]]; then
  TARGETS=(${TOOLS[@]})
fi

copy_tool() {
  local tool="$1"
  case "$tool" in
    claude-code)
      mkdir -p "$HOME/.claude/agents"
      cp "$INTEGRATIONS/claude-code"/*.md "$HOME/.claude/agents/"
      ;;
    antigravity)
      mkdir -p "$HOME/.gemini/antigravity/skills"
      cp -R "$INTEGRATIONS/antigravity"/* "$HOME/.gemini/antigravity/skills/"
      ;;
    gemini-cli)
      mkdir -p "$HOME/.gemini/extensions/agency-devops/skills"
      cp -R "$INTEGRATIONS/gemini-cli/"* "$HOME/.gemini/extensions/agency-devops/skills/"
      ;;
    opencode)
      mkdir -p "$PWD/.opencode/agent"
      cp -R "$INTEGRATIONS/opencode/agent" "$PWD/.opencode/"
      ;;
    cursor)
      mkdir -p "$PWD/.cursor/rules"
      cp -R "$INTEGRATIONS/cursor/rules" "$PWD/.cursor/"
      ;;
    aider)
      cp "$INTEGRATIONS/aider/CONVENTIONS.md" "$PWD/CONVENTIONS.md"
      ;;
    windsurf)
      cp "$INTEGRATIONS/windsurf/.windsurfrules" "$PWD/.windsurfrules"
      ;;
    *) echo "Unknown tool $tool" >&2; exit 1 ;;
  esac
  echo "[OK] Installed for $tool"
}

for tool in "${TARGETS[@]}"; do
  copy_tool "$tool"
done
