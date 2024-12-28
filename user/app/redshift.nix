{ config, lib, ... }:
{
  options = {
    redshift.enable = lib.mkEnableOption "Enables redshift";
  };

  config = lib.mkIf config.redshift.enable {
    #TODO: remove hardcoded geo-location
    services.redshift = {
      enable = true;
      tray = true;
      latitude = 45.3;
      longitude = 12.14;
    };
  };
}
