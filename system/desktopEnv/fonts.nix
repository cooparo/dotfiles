{ pkgs, userSettings, ... }:
{
  # Fonts
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = userSettings.nerdfonts; })
    material-design-icons
    font-awesome
  ];
}
