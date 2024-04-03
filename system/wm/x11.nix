{ pkgs, systemSettings, ... }:
{
    services.xserver = {
        enable = true;
        layout = systemSettings.layout;

        #excludePackages = [ pkgs.xterm ];   
    };
}