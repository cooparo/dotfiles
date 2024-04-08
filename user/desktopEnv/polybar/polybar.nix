{ pkgs, ... }:
{

    services.polybar = {
        enable = true;

        script = ""; # Don't remove this or will throw an error
    };

    home.file.".config/polybar/config.ini".source = ./config.ini;
}