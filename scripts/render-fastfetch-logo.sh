#!/usr/bin/env bash
set -euo pipefail

# Monochrome ASCII rendering of the supplied Nous portal figure. The alpha
# channel preserves the silhouette; blue hair/gear becomes a dense character
# field and the original white illustration remains the brightest detail.
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_image="${1:-$script_dir/assets/portal-figure.webp}"
output_file="${2:-$script_dir/fastfetch-logo.txt}"
width=48
height=30

[[ -f "$source_image" ]] || {
  printf 'missing source image: %s\n' "$source_image" >&2
  exit 1
}
command -v magick >/dev/null 2>&1 || {
  printf 'ImageMagick (magick) is required to render the logo\n' >&2
  exit 1
}

magick "$source_image" -resize "${width}x${height}!" -depth 8 txt:- |
  awk -F '[(),]' -v width="$width" '
    NR > 1 {
      red = $3; green = $4; blue = $5; alpha = $6
      if (alpha < 65) character = " "
      else if (blue > red + 45 && blue > green + 45) {
        if (alpha < 135) character = "."
        else if (alpha < 205) character = "+"
        else character = "#"
      } else if (red + green + blue > 570) character = "@"
      else if (red + green + blue > 400) character = "%"
      else character = "*"

      line = line character
      if (($1 + 1) % width == 0) {
        sub(/[[:space:]]+$/, "", line)
        print line
        line = ""
      }
    }
  ' > "$output_file"
