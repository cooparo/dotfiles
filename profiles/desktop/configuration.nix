{ config, pkgs, userSettings, systemSettings, ... }:

## DESKTOP SYSTEM SETTINGS

{
  imports = [
    ../common/configuration.nix

    ./system/nvidia.nix
    ./system/app/android.nix
  ];

  environment.systemPackages = with pkgs; [

  ];

}