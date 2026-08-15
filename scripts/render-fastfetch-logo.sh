#!/usr/bin/env bash
set -euo pipefail

# Unicode ASCII rendering of the Nous Research portrait.  The source uses a
# transparent background, so sampling alpha rather than luminance keeps the
# graphic's sharp illustrated silhouette intact in every terminal palette.
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_image="${1:-$script_dir/assets/nousresearch-portrait.png}"
output_file="${2:-$script_dir/fastfetch-logo.txt}"
width=46
height=27

[[ -f "$source_image" ]] || {
  printf 'missing source image: %s\n' "$source_image" >&2
  exit 1
}
command -v magick >/dev/null 2>&1 || {
  printf 'ImageMagick (magick) is required to render the logo\n' >&2
  exit 1
}

magick "$source_image" -alpha extract -resize "${width}x${height}!" -depth 8 txt:- |
  awk -F '[(),]' -v width="$width" '
    NR > 1 {
      alpha = $3
      if (alpha < 20) character = " "
      else if (alpha < 72) character = "░"
      else if (alpha < 145) character = "▒"
      else if (alpha < 220) character = "▓"
      else character = "█"

      line = line character
      if (($1 + 1) % width == 0) {
        sub(/[[:space:]]+$/, "", line)
        printf "\033[38;2;167;70;232m%s\033[0m\n", line
        line = ""
      }
    }
  ' > "$output_file"
