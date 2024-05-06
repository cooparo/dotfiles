{ config, pkgs, userSettings, systemSettings, ... }:

## DESKTOP SYSTEM SETTINGS

{
  imports = [
    ../common/configuration.nix

  ];

  environment.systemPackages = with pkgs; [

  ];

}