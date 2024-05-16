{ pkgs, nixvim, userSettings, lib,  ... }:
{
  imports = [ 
		nixvim.homeManagerModules.nixvim
		./keymaps.nix
		./plugins/default.nix
		./ui/default.nix
	];

	home.packages = with pkgs; [
		xclip
		ripgrep
		lazygit
	];

  programs.nixvim = {
		enable = true;
		defaultEditor = true;

		colorschemes.base16.enable = true; 
		colorschemes.base16.colorscheme = lib.mkDefault userSettings.theme; 

		globals.mapleader = " ";

		clipboard.register = "unnamedplus";
		clipboard.providers.xclip.enable = true;
		
		opts = {
			number = true;
			relativenumber = true;

			shiftwidth = 2;
			softtabstop = 2;
			showtabline = 2;
			smartindent = true; # enables autoindenting
			wrap = false;
			breakindent = true;
			backup = false;
			swapfile = false;
			hlsearch = false;
			incsearch = true;
			termguicolors = true;
			scrolloff = 16;

			updatetime = 50; # faster completion (default: 4000ms)
			completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp
			undofile = true;
			cursorline = true; # highlights the line where the cursor is located

			encoding = "utf-8";
			fileencoding = "utf-8";
		};
  };
}
