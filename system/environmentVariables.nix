{
  config,
  lib,
  userSettings,
  ...
}:
{
  options = {
    environmentVariables.enable = lib.mkEnableOption "Enables environment variables";
  };

  config = lib.mkIf config.environmentVariables.enable {
    environment.sessionVariables = with userSettings; {
      ETH_INTERFACE = eth-interface;
      WIFI_INTERFACE = wifi-interface;
      INTERFACE = if (wifi-interface == "") then eth-interface else wifi-interface;
    };
  };
}
