{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    polkit.enable = lib.mkEnableOption "Enables authentication agent polkit";
  };

  config = lib.mkIf config.polkit.enable {
    # TODO: are both needed? lxsession and polkit?

    environment.systemPackages = [
      pkgs.lxde.lxsession
    ];

    security.polkit.enable = true;
  };
}
