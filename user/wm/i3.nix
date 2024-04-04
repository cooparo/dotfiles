{ pkgs, userSettings, ... }: 
{
    xsession.windowManager.i3 = {
        enable = true;

        config = {
            modifier = "Mod4"; # Windows button
            terminal = userSettings.term;
            focus.followMouse = false;

            window.titlebar = false;

            gaps.inner = 5;
            gaps.outer = 2;

            # Start up services
            startup = [
                # Wallpaper
                { command = "feh --bg-fill ${userSettings.dotfilesDir}/wallpaper.jpg"; always = true; notification = false; }
                
                # Reload
                { command = "xrandr --output Virtual-1 --mode 1920x1080"; always=true; notification = false; }

            ];
        };
    };
}