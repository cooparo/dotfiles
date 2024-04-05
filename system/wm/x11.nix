{ pkgs, systemSettings, ... }:
{
    services.xserver = {
        enable = true;
        xkb.layout = systemSettings.layout;
    };
}