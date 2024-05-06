{ config, pkgs, userSettings, systemSettings, ... }:

## DESKTOP USER SETTINGS
{
  imports = [
    ../common/home.nix

    ./user/i3.nix # Startup command

  ];

  home.packages = with pkgs; [

  ];
}