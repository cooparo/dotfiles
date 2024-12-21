{ nix-colors, userSettings, ... }:

{
  imports = [ nix-colors.homeManagerModules.default ];

  colorScheme =
    if userSettings.theme == "everforest" then
      nix-colors.lib.schemeFromYAML "everforest" (
        builtins.readFile ../../theme/everforest/everforest.yaml
      )
    else
      nix-colors.colorSchemes.${userSettings.theme};
}

# scheme: "Nord"
# author: "arcticicestudio"
# base00: "#2E3440"
# base01: "#3B4252"
# base02: "#434C5E"
# base03: "#4C566A"
# base04: "#D8DEE9"
# base05: "#E5E9F0"
# base06: "#ECEFF4"
# base07: "#8FBCBB"
# base08: "#BF616A"
# base09: "#D08770"
# base0A: "#EBCB8B"
# base0B: "#A3BE8C"
# base0C: "#88C0D0"
# base0D: "#81A1C1"
# base0E: "#B48EAD"
# base0F: "#5E81AC"

# scheme: "Gruvbox dark, medium"
# author: "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)"
# base00: "#282828" # ----
# base01: "#3c3836" # ---
# base02: "#504945" # --
# base03: "#665c54" # -
# base04: "#bdae93" # +
# base05: "#d5c4a1" # ++
# base06: "#ebdbb2" # +++
# base07: "#fbf1c7" # ++++
# base08: "#fb4934"
# base09: "#fe8019"
# base0A: "#fabd2f"
# base0B: "#b8bb26"
# base0C: "#8ec07c"
# base0D: "#83a598"
# base0E: "#d3869b"
# base0F: "#d65d0e"

# scheme: "Everforest"
# author: "Sainnhe Park (https://github.com/sainnhe)"
# base00: "#2f383e" # bg0,       palette1 dark (medium)
# base01: "#374247" # bg1,       palette1 dark (medium)
# base02: "#4a555b" # bg3,       palette1 dark (medium)
# base03: "#859289" # grey1,     palette2 dark
# base04: "#9da9a0" # grey2,     palette2 dark
# base05: "#d3c6aa" # fg,        palette2 dark
# base06: "#e4e1cd" # bg3,       palette1 light (medium)
# base07: "#fdf6e3" # bg0,       palette1 light (medium)
# base08: "#7fbbb3" # blue,      palette2 dark
# base09: "#d699b6" # purple,    palette2 dark
# base0A: "#dbbc7f" # yellow,    palette2 dark
# base0B: "#83c092" # aqua,      palette2 dark
# base0C: "#e69875" # orange,    palette2 dark
# base0D: "#a7c080" # green,     palette2 dark
# base0E: "#e67e80" # red,       palette2 dark
# base0F: "#eaedc8" # bg_visual, palette1 dark (medium)
# FIX: everforest coloscheme use cyan for error and red for warnings

# scheme: "Everforest Dark Hard"
# author: "Oskar Liew (https://github.com/OskarLiew)"
# base00: "#272e33" # bg0,        Default background
# base01: "#2e383c" # bg1,        Lighter background
# base02: "#414b50" # bg3,        Selection background
# base03: "#859289" # grey1,      Comments
# base04: "#9da9a0" # grey2,      Dark foreground
# base05: "#d3c6aa" # fg,         Default foreground
# base06: "#e4e1cd" # bg3,        Light foreground
# base07: "#fdf6e3" # bg0,        Light background
# base08: "#7fbbb3" # blue
# base09: "#d699b6" # purple
# base0A: "#dbbc7f" # yellow
# base0B: "#83c092" # aqua
# base0C: "#e69875" # orange
# base0D: "#a7c080" # green
# base0E: "#e67e80" # red
# base0F: "#4C3743" # bg_visual
