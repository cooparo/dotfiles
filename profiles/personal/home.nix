{ config, pkgs, userSettings, systemSettings, ... }:

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
    ../../user/app/zsh.nix # Zsh config

    # Desktop env
    ../../user/desktopEnv/i3/i3.nix # i3 config
    # ../../user/desktopEnv/picom/picom.nix # picom config # FIX: doesn't works
    ../../user/desktopEnv/polybar/polybar.nix # polybar config

    # App
    ../../user/app/git.nix # Git config
    ../../user/app/alacritty.nix # Alacritty config

  ];

  home.packages = with pkgs; [
    
    # Core
    brave
    neovim
    vscode
    neofetch
    git
    zsh
    alacritty
    flameshot

    # Tools
    htop 
    nix-tree # See What Depends on What
    nix-du # See What's Consuming Disk Space
    nix-index # See Which Derivation Supplies a File
    graphviz # Graph visualization 

    # Desktop env
    feh
    picom
    polybar
    lxappearance

    # Building tools
    cmake
    ninja
    meson

    # Dev packages
    pkg-config
    
    # Nerdfont
    (nerdfonts.override { fonts = userSettings.fonts; })
  ];

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

  # NerdFont
  fonts.fontconfig.enable = true;

  home.stateVersion = "23.11"; # Please read the comment before changing.
}
