{ lib, ... }:
{
  imports = [
    ./dunst.nix
    ./i3.nix
    ./lockscreen.nix
    ./nix-colors.nix
    ./rofi.nix
    ./stylix.nix
    ./batsignal.nix
    ./picom/picom.nix
    ./polybar/polybar.nix
  ];

  dunst.enable = lib.mkDefault true;
  i3.enable = lib.mkDefault true;
  lockscreen.enable = lib.mkDefault true;
  nix-colors-conf.enable = lib.mkDefault true;
  rofi.enable = lib.mkDefault true;
  stylix-conf.enable = lib.mkDefault true;
  picom.enable = lib.mkDefault true;
  polybar.enable = lib.mkDefault true;

  batsignal.enable = lib.mkDefault false;
}
