{ userSettings, pkgs, ... }:
let
  wallpaperURL = builtins.readFile ../../wallpaper/${userSettings.theme}/url.txt;
  wallpaperSHA256 = builtins.readFile ../../wallpaper/${userSettings.theme}/sha256.txt;
in
{
  stylix = {
    enable = true;

    image = pkgs.fetchurl {
      url = wallpaperURL;
      sha256 = wallpaperSHA256;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
    polarity = "dark";

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
    };

    cursor = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
      size = 32;
    };
  };
}
