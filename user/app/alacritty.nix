{lib, ...}: 
{
    # TODO: make it modular (use nix color or stylix)
    programs.alacritty = {
        enable = true;
        settings = {
            # TOML value
            window = {
                padding = {x=5; y=5;};
                dynamic_padding = true;
            };
            colors = {
                primary.background = "#282828";
                primary.foreground = "#ebdbb2";
                cursor.text = "#689d6a";
                cursor.cursor = "#8ec07c";
                normal.black = "#1d2021";
                normal.red = "#cc241d";
                normal.green = "#98971a";
                normal.yellow = "#d79921";
                normal.blue = "#458588";
                normal.magenta = "#d3869b";
                normal.cyan = "#83a598";
                normal.white = "#fbf1c7";
                bright.black = "#3c3836";
                bright.red = "#fb4934";
                bright.green = "#b8bb26";
                bright.yellow = "#fabd2f";
                bright.blue = "#458588";
                bright.magenta = "#d3869b";
                bright.cyan = "#83a598";
                bright.white = "#fbf1c7";
            };  
        };
    };
}