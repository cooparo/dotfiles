{ pkgs, userSettings, ...}: 
{
    home.packages = [ pkgs.alacritty ];

    programs.alacritty = {
        enable = true;
        settings = {
            # TOML value
            window = {
                padding = {x=5; y=5;};
                dynamic_padding = true;
            };

            fonts.size = userSettings.fontSize;
        };
    };
}