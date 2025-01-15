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
            # FIX: formatting not working
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
          config = builtins.readFile ./lua/plugins/lualine.lua;
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

      ];

      extraLuaConfig = ''
        				${builtins.readFile ./lua/options.lua}
        			${builtins.readFile ./lua/remap.lua}
        			'';
    };
  };
}
