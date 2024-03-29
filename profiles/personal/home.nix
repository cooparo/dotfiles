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
    ../../user/shell/sh.nix # Zsh config
    ../../user/app/git.nix # Git config
  ];

  home.packages = with pkgs; [
    alacritty
    brave
    neovim
    vscode
    zsh
    
    # Nerdfont
    (nerdfonts.override { fonts = userSettings.fonts; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

  # NerdFont
  fonts.fontconfig.enable = true;

  home.stateVersion = "23.11"; # Please read the comment before changing.
}
