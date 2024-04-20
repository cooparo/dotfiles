{ userSettings, config, ... }:
{
    # kill polybar: polybar-msg cmd quit

    services.polybar = with config.colorScheme.palette;  {
        enable = true;

        script = ''
        polybar-msg cmd quit
        
        echo "---" | tee -a /tmp/polybar.log
        polybar main 2>&1 | tee -a /tmp/polybar.log & disown
        ''; # Don't remove this or will throw an error
        
        extraConfig = ''
        include-directory = ${userSettings.dotfilesDir}/user/desktopEnv/polybar/forest/
        
        [color]
        background = #${base00}
        foreground = #${base04}
        sep = #${base0D}

        white = #FFFFFF
        black = #000000
        red = #EC7875
        pink = #EC407A
        purple = #BA68C8
        blue = #42A5F5
        cyan = #4DD0E1
        teal = #00B19F
        green = #61C766
        lime = #B9C244
        yellow = #FDD835
        amber = #FBC02D
        orange = #E57C46
        brown = #AC8476
        indigo = #6C77BB
        gray = #9E9E9E
        blue-gray = #6D8895
        '';

        # background = #${base00}
        # background-alt = #${base02}
        # foreground = #${base06}
        # primary = #${base0A}
        # secondary = #${base07}
        # alert = #${base08}
        # disabled = #${base03}
        
    };

    # Install Feather font
    home.file.".local/share/fonts/feather.ttf".source = ./forest/font/feather.ttf;
}