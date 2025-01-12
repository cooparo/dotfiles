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
      ];

      plugins = with pkgs.vimPlugins; [
        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./lua/plugins/telescope.lua;
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
# FIX: formatting not working
            ''
              					require("lspconfig").nixd.setup({
              						 cmd = { "nixd" },
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
              				'';
        }
      lazygit-nvim
        nvim-web-devicons
        nvim-treesitter
				nvim-cmp
				cmp-nvim-lsp

      ];

      extraLuaConfig = ''
        				${builtins.readFile ./lua/options.lua}
        			${builtins.readFile ./lua/remap.lua}
        			'';
    };
  };
}
