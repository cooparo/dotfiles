{ userSettings, config, ... }:
{
    # kill polybar: polybar-msg cmd quit

    services.polybar = with config.colorScheme.palette;  {
        enable = true;

        script = "polybar top-bar &"; # Don't remove this or will throw an error
        extraConfig = 
        ''
        include-file = ${userSettings.dotfilesDir}/user/desktopEnv/polybar/config.ini

        [colors]
        background = #${base00}
        background-alt = #${base02}
        foreground = #${base06}
        primary = #${base0A}
        secondary = #${base07}
        alert = #${base08}
        disabled = #${base03}
        '';
    };
}