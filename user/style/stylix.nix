{ lib, pkgs, stylix, ... }: 
{
    imports = [ stylix.homeManagerModules.stylix ];

    stylix = {
        autoEnable = false;

        image = ../../wallpaper.jpg;
        
        polarity = "dark";
        base16Scheme = ./themes/${userSettings.theme}/${userSettings.theme}.yaml;
    
        targets.console.enable = true;
    };
    
}
