{
  userSettings,
  systemSettings,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    vimPlugins.friendly-snippets
  ];

  programs.nixvim.plugins = {
    luasnip = {
      enable = true;

      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };
    # Show function's signature when you type 
    lsp-signature.enable = true;
    # Define which LSP server to use for each language
    lsp-format.enable = true;

    # Language Servers
    lsp = {
      enable = true;

      inlayHints = true;
      keymaps = {
        silent = true;

        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "ca" = "code_action";
          "ff" = "format";
          "K" = "hover";
        };
      };

      servers = {
        # Python
        basedpyright.enable = true;
        ruff.enable = true;
        # Bash 
        bashls.enable = true;
        # Grammar checker
        harper_ls.enable = true;
        # C/C++
        clangd.enable = true;
        # Lua   
        lua_ls.enable = true;
        lua_ls.settings.telemetry.enable = false;

        # Nix lang
        nixd = {
          enable = true;

          # FIXME: semantic-tokens error for lua code
          # cmd = [
          #   "nixd"
          #   "--semantic-tokens=false"
          # ];
          settings = {
            formatting.command = [ "nixfmt" ];
            nixpkgs.expr = "import <nixpkgs> { }";

            options =
              let
                flake = ''(builtins.getFlake "${userSettings.dotfilesDir}")'';
              in
              rec {
                # Completitions for nixos, home manager and nixvim options
                nixos.expr = "${flake}.nixosConfigurations.${systemSettings.host}.options";
                home_manager.expr = "${flake}.homeConfigurations.${userSettings.username}.options";
                nixvim.expr = "${home_manager.expr}.programs.nixvim.type.getSubOptions []";
              };
          };
        };
      };
    };
  };
}