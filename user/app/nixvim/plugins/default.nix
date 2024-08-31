{ userSettings, lib, ... }:
{
  imports = [
    ./cmp.nix
      ./harpoon.nix
      ./lsp.nix
      ./oil.nix
  ];

  programs.nixvim.plugins = {
    lualine = lib.mkForce {		
      enable = true;
      theme = if(userSettings.theme == "nord") then userSettings.theme else "gruvbox_dark";
    };
    telescope.enable = true;
    
    nvim-colorizer.enable = true;

    none-ls.enable = true;
    none-ls.enableLspFormat = true;
    
    lsp-format.enable = true;
    gitsigns.enable = true;
    nvim-autopairs.enable = true;
    comment.enable = true;
    which-key.enable = true;
    lazygit.enable = true;

    bufferline.enable = true;
    bufferline.alwaysShowBufferline = false;
    
    luasnip.enable = true;

    neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      enableRefreshOnWrite = true;
      window.autoExpandWidth = true;
      window.width = 30;
    };

    treesitter = {
      enable = true;
      settings.ensure_installed = [ "c" "lua" "nix" "javascript" "typescript" "python" "rust" "bash"];
    };

    toggleterm = {
      enable = true;
      settings = {
	direction = "float";
	float_opts = {
	  border = "curved";
	  height = 30;
	  width = 130;
	};
      };
    };
  };
}
