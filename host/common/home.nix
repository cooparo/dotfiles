{ pkgs, userSettings, ... }:

## USER SETTINGS

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  nixpkgs.config.allowUnfree = true;

  imports = [

    # Desktop env
    ../../user/desktopEnv/i3.nix # i3 config
    ../../user/desktopEnv/picom/picom.nix # picom config 
    ../../user/desktopEnv/polybar/polybar.nix # polybar config
    ../../user/desktopEnv/rofi.nix # rofi config
    ../../user/desktopEnv/gtk.nix # gtk config
    ../../user/desktopEnv/nix-color.nix # Colorscheme config

    # App
    ../../user/app/zsh.nix # Zsh config
    ../../user/app/git.nix # Git config
    ../../user/app/alacritty.nix # Alacritty config
    ../../user/app/nixvim/nixvim.nix # Neovim config
    ../../user/app/megasync.nix
    ../../user/app/bluetooth.nix # Headset button
    ../../user/app/pkgs-stable.nix
    ../../user/app/ssh.nix
    ../../user/virtualization.nix
    ../../user/app/tmux.nix
  ];

  home.packages = with pkgs; [
    
    # Core
    brave
    vscode
    neofetch
    git
    zsh
    alacritty
    flameshot
    openvpn
    vlc
    tmux

    telegram-desktop
    spotify
    obsidian
    megasync
    discord
    burpsuite

    android-studio

    # Language
    python3
    lua

    # Tools
    htop 
    nix-tree # See What Depends on What
    nix-du # See What's Consuming Disk Space
    nix-index # See Which Derivation Supplies a File
    playerctl # Media player manager (eg. spotify)
    pulseaudioFull
    brightnessctl # Manage display brightness
    pavucontrol
    dhcpcd
    nssmdns

    # Desktop env
    feh
    picom
    rofi
    rofi-power-menu
    gtk3
    autotiling
    lxappearance

 ];

  home.sessionVariables = with userSettings; {
    EDITOR = editor;
    TERM = term;
    SHELL = shell;
    BROWSER = browser;
    FLAKE = dotfilesDir;
  };

  home.stateVersion = "23.11"; # Please read the comment before changing.
}