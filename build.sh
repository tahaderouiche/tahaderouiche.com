#!/usr/bin/env bash
set -euo pipefail

# Convert images to WebP format
# Requires: brew install webp

echo "Converting images to WebP..."

cwebp -q 85 img/profile.png -o img/profile.webp
cwebp -q 80 img/work.jpg -o img/work.webp

for f in img/ed{1,2,3,4}.png; do
  cwebp -q 85 "$f" -o "${f%.png}.webp"
done

echo "Done. WebP files generated."
ls -lh img/*.webp
