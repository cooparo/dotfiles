{ ... }:
{
	imports = [
		./cmp.nix
		./harpoon.nix
		./lsp.nix
	];

  programs.nixvim.plugins = {
		
    lualine.enable = true;
    telescope.enable = true;
    none-ls.enable = true;
    gitsigns.enable = true;

    neo-tree = {
	    enable = true;
	    closeIfLastWindow = true;
    };

		treesitter = {
			enable = true;
			ensureInstalled = [ "c" "lua" "nix" "javascript" "typescript" "python" "help" "rust" ];
		};
	};
}