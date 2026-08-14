#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_image="${1:-$script_dir/assets/nousresearch-logo.png}"
output_file="${2:-$script_dir/fastfetch-logo.txt}"
width=36
height=24
gray_file="$(mktemp)"
trap 'rm -f "$gray_file"' EXIT

magick "$source_image" \
  -background white -alpha remove -alpha off \
  -colorspace gray -resize "${width}x${height}!" \
  -edge 1 -negate -contrast-stretch 0x55% \
  -depth 8 gray:"$gray_file"

od -An -tu1 -v "$gray_file" | awk -v w="$width" -v h="$height" '
  BEGIN { chars = " .:-=+*#%@" }
  { for (i = 1; i <= NF; i++) pixels[++n] = $i }
  END {
    for (y = 0; y < h; y++) {
      line = ""
      for (x = 0; x < w; x++) {
        value = pixels[y * w + x + 1]
        char_index = int((255 - value) * 9 / 255) + 1
        line = line substr(chars, char_index, 1)
      }
      sub(/[[:space:]]+$/, "", line)
      print line
    }
  }
' > "$output_file"
