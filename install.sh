#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_root="${XDG_CONFIG_HOME:-$HOME/.config}"
theme_dir="$config_root/omarchy/themes/nous-theme-purple"

mkdir -p "$theme_dir" "$config_root/omarchy/hooks/theme-set.d"
rsync -a --delete --exclude .git "$script_dir/" "$theme_dir/"
cp "$script_dir/omarchy-hooks/theme-set.d/nous-theme-purple" \
  "$config_root/omarchy/hooks/theme-set.d/nous-theme-purple"
chmod +x "$config_root/omarchy/hooks/theme-set.d/nous-theme-purple"

omarchy theme set nous-theme-purple
