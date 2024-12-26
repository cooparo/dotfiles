{ pkgs, ... }:

## DESKTOP USER SETTINGS
{
  imports = [
    ../../user/default.nix
    ./user/i3.nix # Startup command
  ];
}
