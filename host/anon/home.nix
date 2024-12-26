{ pkgs, ... }:

## DESKTOP USER SETTINGS
{
  imports = [
    ../../user/default.nix

    ./user/i3.nix # Startup command
    ./user/alacritty.nix # Fixes fontSize
    ./user/batsignal.nix # Battery notification
  ];

  home.packages = with pkgs; [
    brightnessctl # Manage display brightness
    powertop
  ];

}
