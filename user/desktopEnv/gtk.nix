{ pkgs, userSettings, ... }:
{
    home.packages = with pkgs; [
        nordic
        qogir-icon-theme
        quintom-cursor-theme
    ];

    gtk = with pkgs; {
        enable = true;

        iconTheme.name = "Qogir";
        iconTheme.package = qogir-icon-theme;

        theme.name = "Nordic";
        theme.package = nordic;

        cursorTheme.name = "Quintom_Snow";
        cursorTheme.package = quintom-cursor-theme;
        cursorTheme.size = 36;
        
    };
}