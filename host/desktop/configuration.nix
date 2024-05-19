{ pkgs, ... }:

## DESKTOP SYSTEM SETTINGS

{
  imports = [
    ../common/configuration.nix

    ./system/nvidia.nix
  ];

  environment.systemPackages = with pkgs; [

  ];

}
