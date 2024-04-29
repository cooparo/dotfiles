{ config, pkgs, userSettings, systemSettings, ... }:

## SYSTEM SETTINGS

{
  imports = [ 
      /etc/nixos/hardware-configuration.nix

      ../../system/bootloader.nix
      ../../system/printer.nix
      ../../system/audio.nix

      # Desktop env
      ../../system/desktopEnv/i3.nix
      ../../system/desktopEnv/x11.nix
      ../../system/desktopEnv/fonts.nix

      # Tools
      ../../system/tools/upgrade-diff.nix # Shows cool list of version changes in sys pkgs
    ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    home-manager
    vim
    wget
    git
    xfce.thunar
  ];

  networking.hostName = systemSettings.hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemSettings.locale;

  i18n.extraLocaleSettings = with systemSettings; {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = userSettings.username;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # I use zsh btw
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
