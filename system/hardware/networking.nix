{
  config,
  lib,
  systemSettings,
  ...
}:
{
  options = {
    networking.enable = lib.mkEnableOption "Enables networking";
  };

  config = lib.mkIf config.networking.enable {
    networking = {
      hostName = systemSettings.host; # Define your hostname.

      # Enables wireless support via wpa_supplicant.
      wireless.enable = lib.mkDefault false;

      # Tailscale: fixing not internet on exit-node
      firewall.checkReversePath = "loose";

      # Enable networking
      networkmanager = {
        enable = true;

        # Stabilize the connections
        wifi.powersave = false;
        wifi.macAddress = "stable-ssid";
      };
    };
  };
}
