# Nous Research · Purple Field Notes

An Omarchy theme layer for the supplied purple Nous Research artwork. The
existing palette is kept intact; this bundle adds the motion, translucency,
instrument-panel layout, Fastfetch mark, and folder icon treatment around it.

## Install locally

```bash
./install.sh
```

The installer copies the theme into `~/.config/omarchy/themes/`, registers a
small scoped theme hook, and selects `nous-theme-purple`. The hook installs the
full Waybar layout, Fastfetch profile, Kitty caret override, and the inherited
`Nous-Research` GTK icon theme. The bundled dark purple field artwork is used
as the theme background.

## What is special here

- Hyprland uses a slow purple-to-lavender border-angle animation, low-opacity
  inactive windows, blur, and violet shadows.
- Kitty uses a beam caret with a native motion trail. Alacritty uses its native
  thin beam caret and eased blink settings.
- Waybar is a compact field-station instrument strip: workspace cells, a
  centered date/time readout, live network/audio/resource telemetry, and a
  restrained scan pulse on the Nous label.
- Fastfetch uses a compact orbital Nous Research sigil with the eye/field-note
  motif from the original Nous theme.
- `assets/folder-icon-source.png` preserves the supplied source art. The
  trimmed 256px/48px derivatives are installed as `folder` and inherited by
  the GTK file-manager folder variants.

The repository intentionally contains the source bundle only. Running the
installer is the explicit deployment step.
