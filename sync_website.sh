#!/usr/bin/env bash
set -euo pipefail

BUCKET="s3://www.tahaderouiche.com"
PROFILE="personal"
EXCLUDE='--exclude "*.sh" --exclude "*.DS_Store" --exclude "*.md" --exclude "README" --exclude ".gitignore" --exclude ".git/*" --exclude "LICENSE" --exclude "build.sh" --exclude ".op/*"'

echo "Syncing to ${BUCKET}..."

# Sync all files with default cache (5 min for HTML, longer for assets)
eval aws s3 sync . "$BUCKET" \
  $EXCLUDE \
  --delete \
  --profile "$PROFILE"

# Set cache headers: HTML short (5 min), assets long (1 week)
aws s3 cp "$BUCKET/index.html" "$BUCKET/index.html" \
  --cache-control "public, max-age=300" \
  --content-type "text/html; charset=utf-8" \
  --metadata-directive REPLACE \
  --profile "$PROFILE"

aws s3 cp "$BUCKET/error.html" "$BUCKET/error.html" \
  --cache-control "public, max-age=300" \
  --content-type "text/html; charset=utf-8" \
  --metadata-directive REPLACE \
  --profile "$PROFILE"

# Set correct content type for WebP images
for f in img/*.webp; do
  key="${f}"
  aws s3 cp "$BUCKET/$key" "$BUCKET/$key" \
    --cache-control "public, max-age=604800, immutable" \
    --content-type "image/webp" \
    --metadata-directive REPLACE \
    --profile "$PROFILE"
done

# Set long cache for CSS
aws s3 cp "$BUCKET/css/style.css" "$BUCKET/css/style.css" \
  --cache-control "public, max-age=604800" \
  --content-type "text/css; charset=utf-8" \
  --metadata-directive REPLACE \
  --profile "$PROFILE"

echo "Done."
