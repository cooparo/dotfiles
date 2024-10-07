{ pkgs, ... }:

## DESKTOP USER SETTINGS
{
  imports = [
    ../common/home.nix

    ./user/i3.nix # Startup command
    ./user/alacritty.nix # Fixes fontSize
    ./user/zsh.nix # Aliases
    ./user/batsignal.nix # Battery notification
  ];

  home.packages = with pkgs; [
    gruvbox-gtk-theme   

    brightnessctl # Manage display brightness
    powertop
  ];

}
