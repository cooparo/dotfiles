{ pkgs, ... }:

## DESKTOP USER SETTINGS
{
  imports = [
    ../../user/default.nix
  ];

  home.packages = with pkgs; [
    brightnessctl # Manage display brightness
    powertop
  ];

  batsignal.enable = true;
}
