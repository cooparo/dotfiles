{ nixos-hardware, ... }:
{
  ## ANON SYSTEM SETTINGS
  imports = [
    /etc/nixos/hardware-configuration.nix

    ../../system/default.nix

    # Hardware optimization
    # From https://github.com/NixOS/nixos-hardware/blob/master/dell/xps/13-9310/default.nix
    nixos-hardware.nixosModules.dell-xps-13-9310
  ];

  powermanagement.enable = true;
}
