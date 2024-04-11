{ lib, userSettings, systemSettings, ... }: 
let 
    mod = "Mod4";
in {

    # Colorscheme
    imports = [ ./themes/${userSettings.theme}.nix ];

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
                # Set wallpaper # TODO: put wallpaper.jpg in home dir
                { command = "feh --bg-fill ${userSettings.dotfilesDir}/wallpaper.jpg"; always = true; notification = false; }
                # Reload display definition
                { command = "xrandr --output Virtual-1 --mode ${systemSettings.resolution}"; always=true; notification = false; }
                # Picom
                # { command = "picom -b"; always=true; notification=false; }
                # Polybar (with always=false, the command get exec only at boot and not every time I restart i3)
                { command = "polybar top-bar"; always=false; notification=false; }
            ];

            keybindings = lib.mkOptionDefault {
                "${mod}+t" = "exec thunar";
                "Print" = "exec flameshot gui";
            };
        };
    };
}