{ lib, systemSettings, ... }:
{
  networking.hostName = systemSettings.hostname; # Define your hostname.

  # Enables wireless support via wpa_supplicant.
  networking.wireless.enable = lib.mkDefault false; 

  # Enable networking
  networking.networkmanager.enable = true;
}