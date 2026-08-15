# Nous Research — Omarchy Theme

<img width="2560" height="1440" alt="screenshot-2026-08-15_01-38-52" src="https://github.com/user-attachments/assets/483dd5c2-7ffa-4d6c-80ca-fa11cd0687ac" />

An original Omarchy theme inspired by the visual language of **Nous Research**: classical Greek imagery, engraved scientific illustration, deep violet, luminous purple, and experimental research-instrument aesthetics.

The desktop combines a **dark purple research atmosphere** with bright violet accents and textured, etched artwork. Kitty, btop, Fastfetch, Neovim, and the rest of the system use a consistent purple interface designed to remain readable without losing the distinctive Nous aesthetic.

## Install

Install directly with Omarchy:

```bash
omarchy-theme-install https://github.com/notkisk/Omarchy-nous-research-purple
```

Then select the installed **Nous Research** theme if Omarchy does not activate it automatically.

The included `install.sh` also installs the scoped global theme hook required for Fastfetch, Waybar's full layout, GTK, Starship, btop refresh, and Kitty's final caret override. This matters because Omarchy does not execute hooks stored inside a theme directory.

### Optional Waybar layout

To overwrite the active Waybar configuration with this theme's layout:

```bash
waybar_theme_dir="$(mktemp -d)"
trap 'rm -rf "$waybar_theme_dir"' EXIT
git clone --depth 1 https://github.com/notkisk/Omarchy-nous-research-purple "$waybar_theme_dir/nous-theme"
mkdir -p ~/.config/waybar
cp "$waybar_theme_dir/nous-theme/waybar/config.jsonc" \
  "$waybar_theme_dir/nous-theme/waybar/style.css" ~/.config/waybar/
omarchy restart waybar
```

The wallpaper is selected automatically from `backgrounds/` by Omarchy. To cycle it later:

```bash
omarchy theme bg next
```

## Included components

* `colors.toml` — source palette for Omarchy's dynamic templates.
* `kitty.conf` — deep violet terminal with a complete ANSI palette, selection/tabs/borders, and a smooth beam caret.
* `fastfetch.jsonc` + `fastfetch-logo.txt` — terminal-native Nous artwork rendered directly through Fastfetch.
* `lua/nous/` + `colors/nous.lua` — standalone Neovim colorscheme with Treesitter, LSP, completion, Telescope, WhichKey, statusline/tabline, floats, search, folds, Git signs, and inactive-pane groups.
* `waybar/` — an optional full Waybar configuration and matching layout CSS using the new thin, minimal purple design.
* `walker.css` + `fuzzel.ini` — native Omarchy launcher styling with matching violet accents.
* `mako.ini`, `gtk.css`, `hyprland.conf`, `hyprlock.conf`, `swayosd.css`, and supporting terminal/editor files.
* `backgrounds/` — Nous-inspired classical and scientific artwork designed specifically for the theme.

## Wallpapers

<table>
  <tr>
    <td align="center">
      <a href="./backgrounds/vibes.jpg">
        <img src="https://github.com/user-attachments/assets/614ccd09-245b-41e2-883b-7279a1488e48" alt="vibes" width="400">
      </a>
    </td>
    <td align="center">
      <a href="./backgrounds/veritas.jpg">
        <img src="https://github.com/user-attachments/assets/347b2e21-d22f-4fc6-8c6f-d8ddd6c55767" alt="veritas" width="400">
      </a>
    </td>
    <td align="center">
      <a href="./backgrounds/nous-purple-field.png">
        <img src="https://github.com/user-attachments/assets/b1b8e643-bcfa-4d9f-a0a8-96f7af198d4f" alt="nous-purple-field" width="400">
      </a>
    </td>
  </tr>
</table>


## Design notes

This theme moves away from the previous blue research-station aesthetic and instead draws from **Greek classical art, scientific engraving, and futuristic research culture**.

The palette centers around:

* **Deep near-black purple** — the primary background.
* **Electric violet** — focus states, borders, highlights, and active elements.
* **Soft lavender** — readable foreground text and secondary UI.
* **Magenta-purple** — selected and emphasized elements.
* **Muted purple-gray** — inactive and informational elements.

The wallpaper direction combines **Greek statues, ancient ruins, celestial geometry, engraved linework, orbital diagrams, and modern research symbolism**. Heavy texture, halftone shading, and etched details give the artwork a physical print/engraving character while the purple palette ties it directly into the desktop UI.

The overall goal is a theme that feels less like a conventional Linux “hacker” theme and more like a **research laboratory from an alternate classical future**.

The Fastfetch portrait remains plain Unicode/ASCII text colored by Fastfetch. It only appears when Fastfetch is run; it is not embedded into Kitty or the wallpaper.
