#!/usr/bin/env bash
set -euo pipefail
if ! command -v act >/dev/null 2>&1; then
  echo "act not installed; see https://github.com/nektos/act" >&2
  exit 1
fi
act -W templates/github-actions/monorepo-ci.yml pull_request
