{ config, pkgs, userSettings, systemSettings, ... }:

## DESKTOP USER SETTINGS
{
  imports = [
    ../common/home.nix

    ./user/i3.nix # Startup command
    ./user/alacritty.nix # Fixes fontSize
  ];

  home.packages = with pkgs; [
    
  ];
}