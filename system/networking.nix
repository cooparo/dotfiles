{ systemSettings, ... }:
{
  networking.hostName = systemSettings.hostname; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  networking.networkmanager.unmanaged = [
    "*-foo-bar"
  ];
}