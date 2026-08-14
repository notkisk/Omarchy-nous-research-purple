#!/usr/bin/env bash
set -euo pipefail

# Render the supplied Nous portal figure as high-detail terminal art. A cell
# carries two vertical pixels, so the face, portal, hand, and shoulder remain
# recognizable while the output still fits beside Fastfetch's data modules.
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_image="${1:-$script_dir/assets/portal-figure.webp}"
output_file="${2:-$script_dir/fastfetch-logo.txt}"
width=44
pixel_height=56
background_r=30
background_g=30
background_b=46

[[ -f "$source_image" ]] || {
  printf 'missing source image: %s\n' "$source_image" >&2
  exit 1
}
command -v magick >/dev/null 2>&1 || {
  printf 'ImageMagick (magick) is required to render the logo\n' >&2
  exit 1
}

# Keep the source aspect ratio in terminal cells: a terminal cell is about
# twice as tall as it is wide, hence 44 columns become 56 source pixels and
# 28 rendered rows.
mapfile -t pixels < <(
  magick "$source_image" \
    -background "#1e1e2e" -alpha remove -alpha off \
    -resize "${width}x${pixel_height}!" -depth 8 txt:- |
    awk -F '[(),]' 'NR > 1 { print $3, $4, $5 }'
)

pixel_color() {
  local r=$1 g=$2 b=$3

  # The source is blue/white line art. Re-map it into the original Nous
  # palette rather than importing the source image's electric blue.
  if (( b > r + 25 && b > g + 25 )); then
    if (( b > 210 )); then
      color_r=203; color_g=166; color_b=247 # #cba6f7 purple highlights
    else
      color_r=137; color_g=180; color_b=250 # #89b4fa blue shading
    fi
  elif (( r + g + b > 420 )); then
    color_r=205; color_g=214; color_b=244     # #cdd6f4 foreground
  elif (( r + g + b > 180 )); then
    color_r=137; color_g=180; color_b=250     # anti-aliased blue shading
  else
    color_r=$background_r; color_g=$background_g; color_b=$background_b
  fi
}

printf '\033[0m' > "$output_file"
for ((y = 0; y < pixel_height; y += 2)); do
  for ((x = 0; x < width; x++)); do
    top_index=$((y * width + x))
    bottom_index=$(((y + 1) * width + x))
    read -r r1 g1 b1 <<<"${pixels[top_index]}"
    read -r r2 g2 b2 <<<"${pixels[bottom_index]}"
    pixel_color "$r1" "$g1" "$b1"
    top_r=$color_r; top_g=$color_g; top_b=$color_b
    pixel_color "$r2" "$g2" "$b2"
    bottom_r=$color_r; bottom_g=$color_g; bottom_b=$color_b

    top_is_background=$((top_r == background_r && top_g == background_g && top_b == background_b))
    bottom_is_background=$((bottom_r == background_r && bottom_g == background_g && bottom_b == background_b))

    if (( top_is_background && bottom_is_background )); then
      printf ' ' >> "$output_file"
    elif (( bottom_is_background )); then
      printf '\033[38;2;%d;%d;%dm\033[48;2;%d;%d;%dm▀' \
        "$top_r" "$top_g" "$top_b" "$background_r" "$background_g" "$background_b" >> "$output_file"
    elif (( top_is_background )); then
      printf '\033[38;2;%d;%d;%dm\033[48;2;%d;%d;%dm▄' \
        "$bottom_r" "$bottom_g" "$bottom_b" "$background_r" "$background_g" "$background_b" >> "$output_file"
    else
      printf '\033[38;2;%d;%d;%dm\033[48;2;%d;%d;%dm▀' \
        "$top_r" "$top_g" "$top_b" "$bottom_r" "$bottom_g" "$bottom_b" >> "$output_file"
    fi
  done
  printf '\033[0m\n' >> "$output_file"
done
