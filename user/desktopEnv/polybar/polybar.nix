{ pkgs, userSettings, config, ... }:
{
    # kill polybar: polybar-msg cmd quit

    services.polybar = with config.colorScheme.palette;  {
        enable = true;

        package = pkgs.polybar.override {
            i3Support = true;
        };

        script = ''
        polybar-msg cmd quit
        
        echo "---" | tee -a /tmp/polybar.log
        polybar main 2>&1 | tee -a /tmp/polybar.log & disown
        '';
        
        # TODO: remove include directory inject file content with builtins.readFile
        extraConfig = ''
        include-directory = ${userSettings.dotfilesDir}/user/desktopEnv/polybar/forest/ 
        
        [color]
        background = #${base00}
        foreground = #${base04}
        sep = #${base0D}

        white = #${base06}
        black = #${base00}
        red = #${base08}
        pink = #EC407A
        purple = #${base0E}
        blue = #${base0D}
        cyan = #${base0C}
        teal = #00B19F
        green = #${base0B}
        lime = #B9C244
        yellow = #${base0A}
        amber = #FBC02D
        orange = #${base09}
        brown = #AC8476
        indigo = #6C77BB
        gray = #${base04}
        blue-gray = #6D8895
        '';
        
    };

    # Install Feather font
    home.file.".local/share/fonts/feather.ttf".source = ./forest/font/feather.ttf;
}