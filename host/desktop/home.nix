{ pkgs, ... }:

## DESKTOP USER SETTINGS
{
  imports = [
    ../common/home.nix

    ./user/i3.nix # Startup command

  ];

  home.packages = with pkgs; [
    nordic
  ];
}
