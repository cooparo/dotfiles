{ pkgs, userSettings, ... }:
{
    services.xserver = {
        enable = true;
        xkb.layout = userSettings.kbLayout;
        xkb.options = "grp:win_space_toggle";
    };
}