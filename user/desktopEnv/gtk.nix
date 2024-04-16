{ pkgs, userSettings, ... }:
{
    home.packages = with pkgs; [
        nordic
        gruvbox-dark-gtk
    ];

    gtk = with pkgs; {
        enable = true;

        # theme = {
        #     package = if (userSettings.theme == "nord") then nordic else gruvbox-dark-gtk;
        #     name = "Nord"; 
        # };
        iconTheme.name = "Qogir";
        theme.name = "Nordic";
        
    };
}