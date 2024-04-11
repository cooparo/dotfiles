{ userSettings, ... }:
{

    services.polybar = {
        enable = true;

        script = "polybar top-bar &"; # Don't remove this or will throw an error
        extraConfig = 
        ''
        include-file = ${userSettings.dotfilesDir}/user/desktopEnv/polybar/themes/${userSettings.theme}.ini
        include-file = ${userSettings.dotfilesDir}/user/desktopEnv/polybar/config.ini
        '';
    };
}