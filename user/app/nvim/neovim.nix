{
  pkgs,
  config,
  lib,
  userSettings,
  systemSettings,
  ...
}:
{
  options = {
    neovim.enable = lib.mkEnableOption "Enables neovim";
  };

  # TODO: constant has to be in bold font
  config = lib.mkIf config.neovim.enable {

    home.packages = with pkgs; [
      lazygit
      nixfmt-rfc-style
      nixd
    ];

    programs.neovim = {
      enable = true;

      defaultEditor = true;
      extraPackages = with pkgs; [
        xclip
        ripgrep
        lua-language-server
        ruff-lsp
        pyright
      ];

      plugins = with pkgs.vimPlugins; [
        # Treesitter
        (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
          p.c
          p.java
          p.nix
          p.python
          p.vim
          p.lua
          p.javascript
          p.html
        ]))

        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/telescope.lua;
        }
        # File explorer
        {
          plugin = oil-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/oil.lua;

        }
        {
          plugin = neo-tree-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/neo-tree.lua;
        }
        {
          plugin = nvim-lspconfig;
          type = "lua";
          config =
            let
              flake = ''(builtins.getFlake "${userSettings.dotfilesDir}")'';
            in
            ''
                            							require("lspconfig").nixd.setup({
                            								 cmd = { "${pkgs.nixd}/bin/nixd" },
                            								 settings = {
                            										nixd = {
                            											 nixpkgs = {
                            													expr = "import <nixpkgs> { }",
                            											 },
                            											 formatting = {
                            													command = { "${pkgs.nixfmt-rfc-style}/bin/nixfmt" },
                            											 },
                            											 options = {
                            													nixos = {
                            														 expr = '${flake}.nixosConfigurations.${systemSettings.host}.options',
                            													},
                            													home_manager = {
                            														 expr = '${flake}.homeConfigurations.${userSettings.username}.options',
                            													},
                            											 },
                            										},
                            								 },
                            							})
              														${builtins.readFile ./lua/plugins/lspconfig.lua}
              														'';
        }
        {
          plugin = bufferline-nvim;
          type = "lua";
          config = ''require("bufferline").setup{}'';
        }

        # Git
        lazygit-nvim

        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/gitsigns.lua;
        }

        # UI
        nvim-web-devicons

        {
          plugin = lualine-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/lualine.lua;
        }
        {
          plugin = alpha-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/alpha.lua;
        }

        # Completion
        luasnip
        cmp-nvim-lsp
        cmp-async-path
        cmp_luasnip
        cmp-cmdline

        {
          plugin = nvim-cmp;
          type = "lua";
          config = builtins.readFile ./lua/plugins/cmp.lua;
        }
        {
          plugin = lsp-format-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/lsp-format.lua;
        }

        # Extra tools
        which-key-nvim

        {
          plugin = todo-comments-nvim;
          type = "lua";
          config = ''require("todo-comments").setup()'';
        }
        {
          plugin = nvim-autopairs;
          type = "lua";
          config = ''require("nvim-autopairs").setup()'';
        }
      ];

      extraLuaConfig = ''
        				${builtins.readFile ./lua/options.lua}
        			${builtins.readFile ./lua/remap.lua}
        			'';
    };
  };
}
