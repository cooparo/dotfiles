{ userSettings, pkgs, ... }:
{
  stylix = {
    image = "/home/paro/wallpaper.jpg";
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
	package = (pkgs.nerdfonts.override { fonts = userSettings.nerdfonts; });
	name = "FiraCode";
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
