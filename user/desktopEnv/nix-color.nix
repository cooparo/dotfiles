{ nix-colors, userSettings, ... }:

let 
    # FIX: temporary solution
    theme = if (userSettings.theme=="gruvbox") then "gruvbox-dark-medium" else userSettings.theme;

in {
    imports = [ nix-colors.homeManagerModules.default ];

    colorScheme = nix-colors.colorSchemes.${theme};
}