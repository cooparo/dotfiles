{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    fonts.enable = lib.mkEnableOption "Enables fonts";
  };
  config = lib.mkIf config.fonts.enable {
    # Fonts
    fonts.fontconfig.enable = true;
    fonts.packages = with pkgs; [
      material-design-icons
      font-awesome
      nerd-fonts.iosevka
      nerd-fonts.bitstream-vera-sans-mono
    ];
  };
}
