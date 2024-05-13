{ ... }:
{
  imports = [
    ./cmp.nix
      ./harpoon.nix
      ./lsp.nix
      ./oil.nix
  ];

  programs.nixvim.plugins = {
		
    lualine.enable = true;
    telescope.enable = true;
    none-ls.enable = true;
    gitsigns.enable = true;
    nvim-autopairs.enable = true;
    comment.enable = true;
    which-key.enable = true;
    lazygit.enable = true;
    bufferline.enable = true;
    bufferline.alwaysShowBufferline = false;

    neo-tree = {
	    enable = true;
	    closeIfLastWindow = true;
	    resizeTimerInterval = 500; 
    };

		treesitter = {
			enable = true;
			ensureInstalled = [ "c" "lua" "nix" "javascript" "typescript" "python" "help" "rust" ];
		};
	};
}
