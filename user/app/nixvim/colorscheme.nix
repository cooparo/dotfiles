{  lib, config, ... }:
{
  programs.nixvim.colorschemes.base16.colorscheme = {
      enable = true;
      # Use nix-colors to rice
      customColorScheme = lib.concatMapAttrs (name: value: {
          ${name} = "#${value}";
        })
      config.colorScheme.palette;
  };
}