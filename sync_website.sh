#!/usr/bin/env bash
set -euo pipefail

aws s3 sync . s3://www.tahaderouiche.com \
  --exclude "*.sh" \
  --exclude "*.DS_Store" \
  --exclude "*.md" \
  --exclude "README" \
  --exclude ".gitignore" \
  --exclude ".git/*" \
  --exclude ".op/*" \
  --exclude ".claude/*" \
  --exclude "LICENSE" \
  --exclude "build.sh" \
  --delete \
  --profile personal
