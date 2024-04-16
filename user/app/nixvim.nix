{ pkgs, lib, nixvim, userSettings, config, ... }:
{
  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
		enable = true;
		defaultEditor = true;
    
		plugins.lualine.enable = true;

		colorschemes.base16.colorscheme = {
			  enable = true;
				# Use nix-colors to rice
				customColorScheme =
					lib.concatMapAttrs (name: value: {
						${name} = "#${value}";
					})
				config.colorScheme.palette;
		};

		opts = {
			number = true;
			shiftwidth = 2;
			relativenumber = true;
		};

	};
}