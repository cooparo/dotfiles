{
  pkgs,
  config,
  lib,
  userSettings,
  systemSettings,
  ...
}:
# TODO: add telescope-frequency
let
  flake = ''(builtins.getFlake "${userSettings.dotfilesDir}")'';
  lspconfig-config = # lua
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

  jdtls-config = # lua
    ''
      			require("lspconfig").jdtls.setup {
      				cmd = { "${pkgs.jdt-language-server}/bin/jdtls" }
      			}
          	'';

in
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
      ruff
      latexrun
      texlab
      texliveTeTeX
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
        # Treesitter
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
          config =
            with config.colorscheme.palette; # lua
            ''
              						require('base16-colorscheme').setup({
                  base00 = '#${base00}', base01 = '#${base01}', base02 = '#${base02}', base03 = '#${base03}',
                  base04 = '#${base04}', base05 = '#${base05}', base06 = '#${base06}', base07 = '#${base07}',
                  base08 = '#${base08}', base09 = '#${base09}', base0A = '#${base0A}', base0B = '#${base0B}',
                  base0C = '#${base0C}', base0D = '#${base0D}', base0E = '#${base0E}', base0F = '#${base0F}',
              })'';
        }

        # File explorer and fz-finder
        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/telescope.lua;
        }
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
          plugin = bufferline-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/bufferline.lua;
        }
        {
          plugin = nvim-jdtls;
          type = "lua";
          config = jdtls-config;
        }

        # Git
        lazygit-nvim

        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/gitsigns.lua;
        }

        # LSP
        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = lspconfig-config;
        }
        {
          plugin = nvim-lightbulb;
          type = "lua";
          config = # lua
            ''
              require("nvim-lightbulb").setup {
              								autocmd = { enabled = true }	
              					}'';
        }

        # UI
        nvim-web-devicons
        lspkind-nvim

        {
          plugin = telescope-ui-select-nvim;
          type = "lua";
          config = # lua
            ''require("telescope").load_extension("ui-select")'';
        }
        {
          plugin = render-markdown-nvim;
          type = "lua";
          config = # lua
            ''require("render-markdown").setup()'';
        }
        {
          plugin = nvim-colorizer-lua;
          type = "lua";
          config = # lua
            ''require("colorizer").setup()'';
        }
        {
          plugin = dropbar-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/dropbar.lua;
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
          config = # lua
            ''require("fidget").setup {}'';
        }
        {
          plugin = indent-blankline-nvim;
          type = "lua";
          config = # lua
            ''require("ibl").setup {}'';
        }
        {
          plugin = satellite-nvim;
          type = "lua";
          config = # lua
            ''require("satellite").setup {}'';
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
          config = # lua
            ''require("luasnip.loaders.from_vscode").lazy_load()'';
        }
        {
          plugin = nvim-cmp;
          type = "lua";
          config = builtins.readFile ./lua/plugins/cmp.lua;
        }
        {
          plugin = lsp-format-nvim;
          type = "lua";
          config = # lua
            ''require('lsp-format').setup {}'';
        }
        {
          plugin = nvim-ts-autotag;
          type = "lua";
          config = builtins.readFile ./lua/plugins/ts-autotag.lua;
        }

        # Diagnostic

        {
          plugin = lsp_lines-nvim;
          type = "lua";
          config = # lua
            ''
              							require("lsp_lines").setup()
              							vim.diagnostic.config({
              								virtual_text = false,
              							})
              						'';
        }

        # LaTex
        {
          plugin = vimtex;
          type = "lua";
          config = builtins.readFile ./lua/plugins/languages/latex.lua;
        }

        # Extra tools
        which-key-nvim

        {
          plugin = lsp_signature-nvim;
          type = "lua";
          config = # lua
            ''require("lsp_signature").setup()'';
        }
        {
          plugin = todo-comments-nvim;
          type = "lua";
          config = # lua
            ''require("todo-comments").setup()'';
        }
        {
          plugin = nvim-autopairs;
          type = "lua";
          config = # lua
            ''require("nvim-autopairs").setup()'';
        }
      ];

      extraLuaConfig = ''
        				${builtins.readFile ./lua/options.lua}
        			${builtins.readFile ./lua/remap.lua}
        			${builtins.readFile ./lua/autocmd.lua}

        			${builtins.readFile ./lua/plugins/languages/lua.lua}
        			${builtins.readFile ./lua/plugins/languages/python.lua}
        			${builtins.readFile ./lua/plugins/languages/nixd.lua}
        			${builtins.readFile ./lua/plugins/languages/yaml.lua}
        			'';
    };
  };
}
