{ lib, config, ... }:
{
  options = {
    geolocation.enable = lib.mkEnableOption "Enables geoclue2";
  };

  config = lib.mkIf config.geolocation.enable {
    location.provider = "geoclue2";

    services.geoclue2 = {
      enable = true;

      enableWifi = true;
      geoProviderUrl = "https://api.beacondb.net/v1/geolocate";

      appConfig = {
        "redshift" = {
          isAllowed = true;
          isSystem = true;
        };
      };
    };
  };
}
