{
  userSettings,
  pkgs,
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
  stylix = {
    enable = true;

    inherit base16Scheme;
    polarity = "dark";

    image = pkgs.fetchurl {
      url = wallpaperURL;
      sha256 = wallpaperSHA256;
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
    };

    cursor = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
      size = 32;
    };
  };
}
