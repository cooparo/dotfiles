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
      ruff
      pyright
      yaml-language-server
    ];

    programs.neovim = {
      enable = true;

      defaultEditor = true;
      extraPackages = with pkgs; [
        xclip
        ripgrep
        lua-language-server
        python312Packages.pylatexenc
        tree-sitter
        nodejs
      ];

      plugins = with pkgs.vimPlugins; [
        {
          plugin = (
            pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
              p.c
              p.java
              p.nix
              p.python
              p.vim
              p.lua
              p.javascript
              p.html
              p.markdown
              p.latex
              p.yaml
            ])
          );
          type = "lua";
          config = builtins.readFile ./lua/plugins/treesitter.lua;
        }
        {
          plugin = nvim-treesitter-context;
          type = "lua";
          config = builtins.readFile ./lua/plugins/treesitter-context.lua;
        }

        {
          # NOTE: this has to be one of the first, so other plugins can use colorscheme here defined
          plugin = base16-nvim;
          type = "lua";
          config = with config.colorscheme.palette; ''
            						require('base16-colorscheme').setup({
                base00 = '#${base00}', base01 = '#${base01}', base02 = '#${base02}', base03 = '#${base03}',
                base04 = '#${base04}', base05 = '#${base05}', base06 = '#${base06}', base07 = '#${base07}',
                base08 = '#${base08}', base09 = '#${base09}', base0A = '#${base0A}', base0B = '#${base0B}',
                base0C = '#${base0C}', base0D = '#${base0D}', base0E = '#${base0E}', base0F = '#${base0F}',
            })'';
        }

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
          config = builtins.readFile ./lua/plugins/bufferline.lua;
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
        lspkind-nvim

        {
          plugin = render-markdown-nvim;
          type = "lua";
          config = ''require("render-markdown").setup()'';
        }
        {
          plugin = nvim-colorizer-lua;
          type = "lua";
          config = ''require("colorizer").setup()'';
        }
        {
          plugin = barbecue-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/barbecue.lua;
        }
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
        {
          plugin = fidget-nvim;
          type = "lua";
          config = ''require("fidget").setup {}'';
        }

        # Completion
				friendly-snippets
        cmp-nvim-lsp
        cmp-async-path
        cmp_luasnip
        cmp-cmdline

        {
          plugin = luasnip;
          type = "lua";
					config = ''require("luasnip.loaders.from_vscode").lazy_load()'';
        }
        {
          plugin = nvim-cmp;
          type = "lua";
          config = builtins.readFile ./lua/plugins/cmp.lua;
        }
        {
          plugin = lsp-format-nvim;
          type = "lua";
          config = ''require('lsp-format').setup {}'';
        }

        # Extra tools
        which-key-nvim
        lsp_signature-nvim # FIX: doesn't work

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

        			${builtins.readFile ./lua/plugins/languages/lua.lua}
        			${builtins.readFile ./lua/plugins/languages/python.lua}
        			${builtins.readFile ./lua/plugins/languages/nixd.lua}
        			${builtins.readFile ./lua/plugins/languages/yaml.lua}
        			'';
    };
  };
}
