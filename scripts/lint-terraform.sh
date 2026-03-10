#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/templates/terraform-root-module"
if ! command -v terraform >/dev/null 2>&1; then
  echo "terraform not installed" >&2
  exit 1
fi
terraform -chdir="$ROOT" init -backend=false > /dev/null
terraform -chdir="$ROOT" fmt -check
terraform -chdir="$ROOT" validate
