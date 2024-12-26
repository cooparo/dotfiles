{ lib, config, ... }:
{
  options = {
    gnome.enable = lib.mkEnableOption "Enables gnome";
  };
  config = lib.mkIf config.gnome.enable {
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };
}
