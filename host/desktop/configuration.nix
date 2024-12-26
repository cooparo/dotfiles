{
  # DESKTOP SYSTEM SETTINGS
  imports = [
    /etc/nixos/hardware-configuration.nix

    ../../system/default.nix
  ];

  nvidia.enable = true;
}
