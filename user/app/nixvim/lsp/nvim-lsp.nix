{
  userSettings,
  systemSettings,
  pkgs,
  ...
}:
{
  programs.nixvim.plugins = {
    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [ { paths = pkgs.vimPlugins.friendly-snippets; } ];
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
        pyright.enable = true;
        ruff.enable = true;
        # typescript
        ts_ls.enable = true;
        # Bash
        bashls.enable = true;
        # C/C++
        clangd.enable = true;
        # Lua
        lua_ls.enable = true;
        lua_ls.settings.telemetry.enable = false;

        # Java
        jdtls.enable = true;

        # Nix lang
        nil_ls = {
          enable = false;

          settings = {
            formatting.command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
            nix = {
              maxMemoryMB = null;
              flake.autoArchive = false;
              flake.autoEvalInputs = false;
            };
          };
        };

        nixd = {
          enable = true;

          # NOTE: see https://github.com/nix-community/nixd/commit/d6e2390a5564a104dc771d0e5d495f6488ba675e
          # in nixd version 2.5.1 --semantic-tokens it is disabled temporaly bc of the troubles that generates
          # cmd = [
          #   "nixd"
          #   "--semantic-tokens=true"
          # ];

          settings = {
            formatting.command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
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
