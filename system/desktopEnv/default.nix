{ lib, ... }:
{
  imports = [
    ./fonts.nix
    ./i3.nix
    ./stylix.nix
    ./x11.nix
    ./gnome.nix
    ./thunar.nix
  ];

  fonts.enable = lib.mkDefault true;
  i3.enable = lib.mkDefault true;
  stylix-conf.enable = lib.mkDefault true;
  x11.enable = lib.mkDefault true;
  gnome.enable = lib.mkDefault true;
}
