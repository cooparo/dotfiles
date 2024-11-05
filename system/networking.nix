{ lib, systemSettings, ... }:
{
  networking = {
    hostName = systemSettings.host; # Define your hostname.

    # Enables wireless support via wpa_supplicant.
    wireless.enable = lib.mkDefault false;

    # Tailscale: fixing not internet on exit-node
    firewall.checkReversePath = "loose";

    # Enable networking
    networkmanager = {
      enable = true;

      wifi.powersave = false;
      wifi.macAddress = "stable-ssid";
    };
  };
}
