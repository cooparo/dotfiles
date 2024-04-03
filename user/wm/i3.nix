{ pkgs, userSettings, ... }: 
{
    xsession.windowManager.i3 = {
        enable = true;
        config = {
            modifier = "Mod4"; # Windows button
            terminal = userSettings.term;
            focus.followMouse = false;

            gaps.inner = 5;
            gaps.outer = 2;

            startup = [
                { command = "feh --bg-fill ~/wallpaper.jpg"; always = true; notification = false; }
                { command = "xrandr --output Virtual-1 --mode 1920x1080"; always=true; notification = false; }
            ];
        };
    };
}