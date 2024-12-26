{
  lib,
  config,
  userSettings,
  systemSettings,
  ...
}:
{

  options = {
    x11.enable = lib.mkEnableOption "Enables x11";
  };

  config = lib.mkIf config.x11.enable {
    services.xserver = {
      enable = true;
      xkb.layout = userSettings.kbLayout;
      xkb.options = if systemSettings.host == "desktop" then "grp:win_space_toggle" else "";
    };

  };
}
