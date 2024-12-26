{ pkgs, lib, ... }:
{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./security.nix
    ./docker.nix
    ./networking.nix
    ./openvpn.nix
    ./printer.nix
    ./ssh.nix
    ./tailscale.nix
    ./thunar.nix
    ./virtualization.nix
    ./wireshark.nix
    ./powermanagement.nix
    ./locale.nix
    ./users.nix
    ./zsh.nix
    ./nix.nix
    ./environmentVariables.nix
    ./nvidia.nix

    ./tools/default.nix
    ./desktopEnv/default.nix
  ];

  # Modules default true
  audio.enable = lib.mkDefault true;
  bluetooth.enable = lib.mkDefault true;
  bootloader.enable = lib.mkDefault true;
  security.enable = lib.mkDefault true;
  docker.enable = lib.mkDefault true;
  networking.enable = lib.mkDefault true;
  openvpn.enable = lib.mkDefault true;
  printer.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
  tailscale.enable = lib.mkDefault true;
  thunar.enable = lib.mkDefault true;
  virtualization.enable = lib.mkDefault true;
  wireshark.enable = lib.mkDefault true;
  locale.enable = lib.mkDefault true;
  users.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  nix-conf.enable = lib.mkDefault true;
  environmentVariables.enable = lib.mkDefault true;

  # Modules default false
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
