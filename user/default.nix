{
  userSettings,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./virtualization.nix

    ./app/default.nix
    ./desktopEnv/default.nix
  ];

  virtualization.enable = lib.mkDefault true;

  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    inherit (userSettings) username;
    homeDirectory = "/home/${userSettings.username}";

    packages =
      let
        # Enabling options disabled by default
        airgeddonFull = pkgs.airgeddon.override {
          supportHashCracking = true;
          # supportEvilTwin = true; # FIX: doesn't build
        };
      in
      with pkgs;
      [
        # Core
        brave
        neofetch
        git
        zsh
        alacritty
        vlc
        unzip

        # App
        telegram-desktop
        spotify
        obsidian
        discord
        docker
        qbittorrent
        libreoffice
        vscode
        tmux
        electrum
        zathura
        zoom-us

        # Language
        python3
        lua
        gdb # GNU project debugger

        # Tools
        htop
        playerctl # Media player manager (eg. spotify)
        pulseaudioFull
        pavucontrol # Manage audio
        dhcpcd
        nssmdns
        openssl
        zoxide # smarter cd
        fzf
        flameshot
        bat
        gitflow
        merge-fmt

        # Desktop env
        picom # Compositor
        rofi # Menu
        rofi-power-menu
        autotiling # Open window by golden ratio
        alsa-utils
        libnotify # Notification

        ## For betterlockscreen
        bc
        xorg.xdpyinfo
        xorg.xrandr
        xorg.xrdb
        xorg.xset
        imagemagick
        i3lock-color

        # CyberSec tools
        nmap
        burpsuite
        seclists
        exiftool
        file
        macchanger
        airgeddonFull
      ];

    sessionVariables = with userSettings; {
      EDITOR = editor;
      TERM = term;
      SHELL = shell;
      BROWSER = browser;
      FLAKE = dotfilesDir;
    };

    stateVersion = "23.11"; # Please read the comment before changing.
  };
}
