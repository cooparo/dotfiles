{ pkgs, userSettings, ... }:
{
    home.packages = with pkgs; [
        nordic
        qogir-icon-theme
        vimix-cursors
    ];

    gtk = with pkgs; {
        enable = true;

        iconTheme.name = "Qogir";
        iconTheme.package = pkgs.qogir-icon-theme;

        theme.name = "Nordic";
        theme.package = pkgs.nordic;

        cursorTheme.name = "Vimix-cursors";
        cursorTheme.package = pkgs.vimix-cursors;
        
    };
}