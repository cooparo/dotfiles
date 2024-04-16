{ pkgs, lib, nixvim, userSettings, config, ... }:
{
  imports = [ 
		nixvim.homeManagerModules.nixvim
		./keymaps.nix
		./plugins.nix
		./colorScheme.nix
	];

  programs.nixvim = {
		enable = true;
		defaultEditor = true;

		globals.mapleader = " ";
		
		opts = {
			number = true;
			shiftwidth = 2;
			relativenumber = true;
		};
	};
}