{ userSettings, ... }:

let

    font = builtins.elemAt userSettings.fonts 0; # First element of fonts list
    size = toString userSettings.fontSize;

in {
    programs.rofi = {
        enable = true;
        font = "${font} ${size}";
        theme = ./themes/${userSettings.theme}.rasi;
    };
}
