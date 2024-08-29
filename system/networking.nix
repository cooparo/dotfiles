{ lib, systemSettings, ... }:
{
  networking.hostName = systemSettings.host; # Define your hostname.

  # Enables wireless support via wpa_supplicant.
  networking.wireless.enable = lib.mkDefault false; 

  # Enable networking
  networking.networkmanager.enable = true;

  # Tailscale: fixing not internet on exit-node
  networking.firewall.checkReversePath = "loose";
}
