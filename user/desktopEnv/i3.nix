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
            gaps.smartGaps = true;

            # Start up command
            startup = [
                # Set wallpaper
                { command = "feh --bg-fill ~/.wallpaper.jpg"; always = true; notification = false; }
                # Picom
                { command = "picom -b --config ${userSettings.dotfilesDir}/user/desktopEnv/picom/picom.conf"; always=true; notification=false; } 
                # Polybar 
                { command = "systemctl --user restart polybar.service"; always=true; notification=false; }
                { command = "autotiling &"; always=true; notification=false; }
            ];

            keybindings = lib.mkOptionDefault {
                "${mod}+t" = "exec thunar";
                "Print" = "exec flameshot gui";
                "${mod}+d" = "exec rofi -show drun";
                "${mod}+p" = "exec rofi -show power-menu -modi power-menu:rofi-power-menu";
                "${mod}+o" = "exec rofi -show window";

                # Audio
                "XF86AudioMute" = "exec amixer sset Master toggle";
                "XF86AudioRaiseVolume" = "exec amixer sset Master 10%+";
                "XF86AudioLowerVolume" = "exec amixer sset Master 10%-";
                "XF86AudioPrev" = "exec playerctl previous";
                "XF86AudioNext" = "exec playerctl next";
                "XF86AudioPlay" = "exec playerctl play-pause";

                # Brightness
                "XF86MonBrightnessUp" = "exec brightnessctl set 10%+";
                "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";
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