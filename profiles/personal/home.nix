{ config, pkgs, userSettings, systemSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    alacritty
    brave
    eza
    neovim
    oh-my-zsh
    vscode

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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/paro/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        gs = "git status";
        satoshi = "ssh paro@192.168.0.158";
        ls = "exa -TlL 1 --color-scale --icons --sort=type --no-time";
        la = "exa -aTlL1 --color-scale --icons --sort=type --no-time";
      };

      oh-my-zsh = { 
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };  
    };

    git = {
      enable = true;
      userName = "cooparo";
      userEmail = userSettings.email;
      extraConfig = {
        # core = {};
        pull = { rebase = "false"; };
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # NerdFont
  fonts.fontconfig.enable = true;
}
