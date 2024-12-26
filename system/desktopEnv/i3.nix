{ lib, config, ... }:
{
  options = {
    i3.enable = lib.mkEnableOption "Enables i3";
  };

  config = lib.mkIf config.i3.enable {
    services.xserver.windowManager.i3.enable = true;
  };
}
