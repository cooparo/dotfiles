{ lib, userSettings, systemSettings, config, ... }: 
let 
    mod = "Mod4";

    # Colorscheme
    palette = config.colorScheme.palette;

    text = "#${palette.base07}";
    focused = "#${palette.base0C}";
    inactive = "#${palette.base02}";
    unfocused = "#${palette.base00}";
    urgent = "#${palette.base08}";
    
in {

    xsession.windowManager.i3 = {
        enable = true;

        config = {
            modifier = mod; # Windows button
            defaultWorkspace = "workspace number 1";
            terminal = userSettings.term;
            focus.followMouse = false;
            bars = [];

            window.titlebar = false;

            gaps.inner = 5;
            gaps.outer = 2;

            # Start up services
            startup = [
                # Set wallpaper
                { command = "feh --bg-fill ~/wallpaper.jpg"; always = true; notification = false; }
                # Reload display definition
                { command = "xrandr --output Virtual-1 --mode ${systemSettings.resolution}"; always=true; notification = false; }
                # Picom
                # { command = "picom -b"; always=true; notification=false; }
                # Polybar (with always=false, the command get exec only at boot and not every time I restart i3)
                { command = "polybar top-bar"; always=false; notification=false; }
                { command = "polybar-msg cmd quit && systemctl --user restart polybar.service"; always=true; notification=false; }
            ];

            keybindings = lib.mkOptionDefault {
                "${mod}+t" = "exec thunar";
                "Print" = "exec flameshot gui";
                "${mod}+d" = "exec rofi -show drun -show-icons";
                "${mod}+p" = "exec rofi -show power-menu -modi power-menu:rofi-power-menu";
                "${mod}+o" = "exec rofi -show window";
            };
        
            colors = {
                focused = {
                    border = focused;
                    background = focused;
                    text = text;
                    indicator = focused;
                    childBorder = focused;
                };

                focusedInactive = {
                    border = inactive;
                    background = inactive;
                    text = text;
                    indicator = inactive;
                    childBorder = inactive;
                };
                unfocused = {
                    border = unfocused;
                    background = unfocused;
                    text = inactive;
                    indicator = unfocused;
                    childBorder = unfocused;
                };
                urgent = {
                    border = urgent;
                    background = urgent;
                    text = text;
                    indicator = urgent;
                    childBorder = urgent;
                };
            };
        };  
    };
}