{ pkgs, userSettings, ... }:
{
  # Fonts
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    material-design-icons
    font-awesome
    nerd-fonts.iosevka
    nerd-fonts.bitstream-vera-sans-mono
  ];
}
