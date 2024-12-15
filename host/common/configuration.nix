{
  pkgs,
  userSettings,
  systemSettings,
  inputs,
  ...
}:

## SYSTEM SETTINGS

{
  imports = [
    /etc/nixos/hardware-configuration.nix

    ../../system/bootloader.nix
    ../../system/printer.nix
    ../../system/audio.nix
    ../../system/doas.nix
    ../../system/bluetooth.nix
    ../../system/networking.nix
    ../../system/ssh.nix
    ../../system/tailscale.nix
    ../../system/virtualization.nix
    ../../system/openvpn.nix
    ../../system/docker.nix
    ../../system/wireshark.nix

    # Desktop env
    ../../system/desktopEnv/i3.nix
    ../../system/desktopEnv/x11.nix
    ../../system/desktopEnv/fonts.nix
    ../../system/desktopEnv/stylix.nix
    ../../system/thunar.nix

    # Tools
    ../../system/tools/upgrade-diff.nix # Shows cool list of version changes in sys pkgs
    ../../system/tools/garbage-collector.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    vim
    wget
    git
    xfce.thunar
    man-pages
    gparted
    # pkgs-stable.etcher

    # Authentication
    lxde.lxsession

    # Language
    gcc # c lang
    libclang

    # Building tools
    cmake
    ninja
    meson
    gnumake
    dbus

    # Dev packages
    pkg-config
    nixd

    # Virtualization
    qemu
    virt-manager
    libvirt
  ];

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

    # LANGUAGE = locale;
    # LC_ALL = locale;
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = userSettings.username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "kvm" # kvm is Kernel Virtual Machine, it's for hardware acceleration
    ];
  };

  # I use zsh btw
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    settings.warn-dirty = false;
  };

  environment.sessionVariables = with userSettings; {
    ETH_INTERFACE = eth-interface;
    WIFI_INTERFACE = wifi-interface;
    INTERFACE = if (wifi-interface == "") then eth-interface else wifi-interface;
  };
}
