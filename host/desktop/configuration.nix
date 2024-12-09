{ pkgs, ... }:

## DESKTOP SYSTEM SETTINGS

{
  imports = [
    ../common/configuration.nix

    ./system/nvidia.nix
    ./system/x11.nix
  ];

  environment.systemPackages = with pkgs; [

  ];

}
