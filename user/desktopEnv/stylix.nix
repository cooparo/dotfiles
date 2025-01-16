{
  userSettings,
  pkgs,
  lib,
  config,
  ...
}:
let
  wallpaperURL = builtins.readFile ../../themes/${userSettings.theme}/bg-url.txt;
  wallpaperSHA256 = builtins.readFile ../../themes/${userSettings.theme}/bg-sha256.txt;

  base16Scheme =
    if userSettings.theme == "everforest" then
      ../../themes/everforest/everforest.yaml
    else
      "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
in
{
  options = {
    stylix-conf.enable = lib.mkEnableOption "Enables stylix configuration";
  };

  config = lib.mkIf config.stylix-conf.enable {
    stylix = {
      enable = true;

      inherit base16Scheme;
      polarity = "dark";

      targets = {
        dunst.enable = false;
        rofi.enable = false;
        i3.enable = false;
        nixvim.enable = false;
        neovim.enable = false;
        alacritty.enable = false;
      };

      image = pkgs.fetchurl {
        url = wallpaperURL;
        sha256 = wallpaperSHA256;
      };

      iconTheme = {
        enable = true;
        package = pkgs.qogir-icon-theme;
        dark = "Qogir-dark";
        light = "Qogir";
      };

      fonts = {
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        monospace = {
          package = pkgs.nerd-fonts.bitstream-vera-sans-mono;
          name = "Bitstream Vera Sans Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };

        sizes = {
          applications = 11;
          desktop = 10;
          popups = 10;
          terminal = 11;
        };
      };

      cursor = {
        package = pkgs.qogir-icon-theme;
        name = "Qogir";
        size = 32;
      };
    };

  };
}
