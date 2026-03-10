#!/usr/bin/env bash
set -euo pipefail
if ! command -v lychee >/dev/null 2>&1; then
  echo "Install lychee for link checking (cargo install lychee)." >&2
  exit 1
fi
lychee README.md CONTRIBUTING.md $(find foundation delivery runtime assurance enablement strategy examples -name '*.md')
