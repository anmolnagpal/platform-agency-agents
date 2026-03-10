#!/usr/bin/env bash
set -euo pipefail
AGENT_DIRS=(foundation delivery runtime assurance enablement)
REQUIRED_FRONTMATTER=(name description color)
REQUIRED_SECTIONS=("Identity" "Core Mission" "Critical" "Deliverables" "Workflow" "Success")

files=()
if [[ $# -gt 0 ]]; then
  files=("$@")
else
  for dir in "${AGENT_DIRS[@]}"; do
    while IFS= read -r f; do
      files+=("$f")
    done < <(find "$dir" -maxdepth 1 -name '*.md' -type f | sort)
  done
fi

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No agent files found" >&2
  exit 1
fi

echo "Linting ${#files[@]} agents..."
errors=0
for file in "${files[@]}"; do
  if [[ $(head -1 "$file") != "---" ]]; then
    echo "ERROR $file missing frontmatter"
    errors=$((errors+1))
    continue
  fi
  frontmatter=$(awk 'NR==1{next} /^---$/{exit} {print}' "$file")
  body=$(awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$file")
  for field in "${REQUIRED_FRONTMATTER[@]}"; do
    if ! grep -q "^$field:" <<<"$frontmatter"; then
      echo "ERROR $file missing $field"
      errors=$((errors+1))
    fi
  done
  for section in "${REQUIRED_SECTIONS[@]}"; do
    if ! grep -qi "$section" <<<"$body"; then
      echo "WARN  $file missing section containing '$section'"
    fi
  done
  if [[ $(wc -w <<<"$body") -lt 120 ]]; then
    echo "WARN  $file body under 120 words"
  fi
  if ! grep -q '```' <<<"$body"; then
    echo "WARN  $file missing code snippet"
  fi
  if ! grep -qi 'metric' <<<"$body"; then
    echo "WARN  $file missing metrics"
  fi
  if ! grep -qi 'evidence' <<<"$body"; then
    echo "WARN  $file missing evidence language"
  fi
  if [[ $body != *"CONTROL LOOP"* && $body != *"Control Loop"* ]]; then
    echo "WARN  $file does not mention Control Loop orchestration"
  fi
  echo "OK    $file"
done

if [[ $errors -gt 0 ]]; then
  echo "FAILED"
  exit 1
fi

echo "PASS"
