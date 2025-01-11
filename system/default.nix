{ pkgs, lib, ... }:
{
  imports = [
    ./grub.nix
    ./locale.nix
    ./users.nix
    ./virtualization.nix
    ./geolocation.nix

    ./app/default.nix
    ./hardware/default.nix
    ./lang/default.nix
    ./security/default.nix
    ./tools/default.nix
    ./desktopEnv/default.nix
  ];

  audio.enable = lib.mkDefault true;
  bluetooth.enable = lib.mkDefault true;
  grub.enable = lib.mkDefault true;
  docker.enable = lib.mkDefault true;
  networking.enable = lib.mkDefault true;
  openvpn.enable = lib.mkDefault true;
  printer.enable = lib.mkDefault true;
  tailscale.enable = lib.mkDefault true;
  thunar.enable = lib.mkDefault true;
  virtualization.enable = lib.mkDefault true;
  wireshark.enable = lib.mkDefault true;
  locale.enable = lib.mkDefault true;
  users.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;

  powermanagement.enable = lib.mkDefault false;
  nvidia.enable = lib.mkDefault false;

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    home-manager
    vim
    wget
    git
    man-pages
    gparted
    gnupg

    # Authentication
    lxde.lxsession

    # Language
    gcc # c lang
    libclang
    perl

    # Building tools
    cmake
    ninja
    meson
    gnumake
    dbus

    # Dev packages
    pkg-config
    nixd

    # TODO: setup cachix
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
