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
    ../../user/desktopEnv/nix-color.nix # Colorscheme config
    ../../user/desktopEnv/dunst.nix # Notification
    ../../user/desktopEnv/lockscreen.nix
    ../../user/desktopEnv/stylix.nix

    # App
    ../../user/app/vim/vim.nix # Vim options
    ../../user/app/zsh/zsh.nix # Zsh config
    ../../user/app/git.nix # Git config
    ../../user/app/alacritty.nix # Alacritty config
    ../../user/app/nixvim/nixvim.nix # Neovim config
    ../../user/app/megasync.nix
    ../../user/app/bluetooth.nix # Headset button
    ../../user/app/pkgs-stable.nix
    ../../user/app/ssh.nix
    ../../user/virtualization.nix
    ../../user/app/tmux.nix
    ../../user/app/redshift.nix

  ];

  home.packages = with pkgs; [
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
    megasync
    discord
    docker
    qbittorrent
    gimp
    libreoffice
    zoom-us
    vscode
    tmux
    electrum

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
