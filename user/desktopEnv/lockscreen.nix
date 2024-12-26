{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    lockscreen.enable = lib.mkEnableOption "Enables lockscreen";
  };

  config = lib.mkIf config.lockscreen.enable {
    home.packages = with pkgs; [
      betterlockscreen
    ];

    services.betterlockscreen = {
      enable = true;
      arguments = [ "blur" ];
      inactiveInterval = 20;
    };
  };
}
