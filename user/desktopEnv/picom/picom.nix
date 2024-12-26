{ lib, config, ... }:
{
  options = {
    picom.enable = lib.mkEnableOption "Enables picom";
  };

  config = lib.mkIf config.picom.enable {
    home.file.".config/picom/picom.conf" = {
      source = ./picom.conf;
      target = ".config/picom/picom.conf";
    };
  };
}
