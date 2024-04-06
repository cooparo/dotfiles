{ pkgs, ... }:
{
    services.xserver = {
        windowManager.i3 = {
            enable = true;

            # TODO: remove extraPackages
            extraPackages = with pkgs; [
                i3status # gives you the default i3 status bar
            ];
        };
    };
}