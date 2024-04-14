{ nix-colors, userSettings, ... }:

{
    imports = [ nix-colors.homeManagerModules.default ];

    colorScheme = nix-colors.colorSchemes.${userSettings.theme};
}