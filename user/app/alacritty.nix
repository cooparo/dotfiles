{ config, ...}: 
{
    programs.alacritty = {
        enable = true;
        settings = {
            # TOML value
            window = {
                padding = {x=5; y=5;};
                dynamic_padding = true;
            };
            colors = with config.colorScheme.palette; {
                primary.background = "#${base00}";
                primary.foreground = "#${base06}";
                cursor.text = "#${base0F}";
                cursor.cursor = "#${base0C}";
                normal.black = "#${base00}";
                normal.red = "#${base08}";
                normal.green = "#${base0B}";
                normal.yellow = "#${base0A}";
                normal.blue = "#${base0D}";
                normal.magenta = "#${base0E}";
                normal.cyan = "#${base0C}";
                normal.white = "#${base07}";
            };  
        };
    };
}