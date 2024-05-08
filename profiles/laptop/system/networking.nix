{ lib, ... }:
{
  networking.wireless.enable = lib.mkForce true;  # Enables wireless support via wpa_supplicant.

  # Resolve conflicts between networkmanager and networking.wireless
  networking.networkmanager.unmanaged = [
    "*-foo-bar"
  ];

  
}