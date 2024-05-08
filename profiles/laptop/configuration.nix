{ pkgs, nixos-hardware, ... }:

## DESKTOP SYSTEM SETTINGS

{
  imports = [
    ../common/configuration.nix

    # From https://github.com/NixOS/nixos-hardware/blob/master/dell/xps/13-9310/default.nix
    nixos-hardware.nixosModules.dell-xps-13-9310
  ];

  environment.systemPackages = with pkgs; [

  ];

}