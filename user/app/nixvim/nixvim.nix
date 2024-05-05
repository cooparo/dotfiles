{ pkgs, lib, nixvim, userSettings, config, ... }:
{
  imports = [ 
		nixvim.homeManagerModules.nixvim
		./keymaps.nix
		./plugins.nix
		./colorscheme.nix
	];

	home.packages = with pkgs; [
		xclip
	];

  programs.nixvim = {
		enable = true;
		defaultEditor = true;

		globals.mapleader = " ";

		clipboard.providers.xclip.enable = true;
		
		opts = {
			number = true;
			shiftwidth = 2;
			relativenumber = true;
		};
	};
}