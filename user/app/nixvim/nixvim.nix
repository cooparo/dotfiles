{
  pkgs,
  nixvim,
  config,
  lib,
  ...
}:
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./bufferline.nix
    ./neo-tree.nix
    ./keymaps.nix
    ./lualine.nix
    ./oil.nix
    ./telescope.nix

    ./language/treesitter.nix
    ./language/nvim-lint.nix

    ./git/lazygit.nix
    ./git/gitsigns.nix
    ./git/diffview.nix

    ./completion/cmp.nix
    ./completion/lspkind.nix

    ./lsp/nvim-lsp.nix
    ./lsp/fidget.nix

    ./ui/alpha.nix
    ./ui/barbecue.nix
    ./ui/notify.nix
    ./ui/indent-blankline.nix
  ];

  options = {
    nixvim.enable = lib.mkEnableOption "Enables nixvim";
  };

  config = lib.mkIf config.nixvim.enable {
    home.packages = with pkgs; [
      xclip
      ripgrep
      lazygit
    ];

    programs.nixvim = {
      enable = true;
      defaultEditor = true;

      colorschemes.base16 =
        let
          formatColor = color: "#${color}";
          formatPalette = builtins.mapAttrs (_: color: formatColor color) config.colorscheme.palette;
        in
        {
          enable = true;
          colorscheme = formatPalette;
        };

      globals.mapleader = " ";

      clipboard.register = "unnamedplus";
      clipboard.providers.xclip.enable = true;

      plugins = {
        web-devicons.enable = true;
        mini.enable = true;
        nvim-autopairs.enable = true;
        colorizer.enable = true;
        which-key.enable = true;
        nvim-surround.enable = true;
        todo-comments.enable = true;
      };

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
        scrolloff = 8;

        updatetime = 50; # faster completion (default: 4000ms)
        completeopt = [
          "menuone"
          "noselect"
          "noinsert"
        ]; # mostly just for cmp
        undofile = true;
        cursorline = true; # highlights the line where the cursor is located

        encoding = "utf-8";
        fileencoding = "utf-8";
      };
    };

  };
}
