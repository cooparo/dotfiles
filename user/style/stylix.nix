{ lib, pkgs, stylix, ... }: 
{
    imports = [ stylix.homeManagerModules.stylix ];

    stylix = {
        autoEnable = false;

        image = pkgs.fetchurl {
            url = "https://c4.wallpaperflare.com/wallpaper/446/361/284/nord-nord-pack-hd-wallpaper-preview.jpg";
            sha256 = "f6cd0314f8d0a177ab3348050a944153dc7d11b0e75c48e1b058603429475066"; 
        };
        
        polarity = "dark";
        base16Scheme = ./themes/${userSettings.theme}/${userSettings.theme}.yaml;
    
        targets.console.enable = true;
    };
    
}
