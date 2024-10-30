{
  userSettings,
  systemSettings,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
  ];

  programs.nixvim.plugins = {
    luasnip.enable = true;
    # VSCode 💡(suggestions) for neovim's built-in LSP.
    nvim-lightbulb.enable = true;
    # This tiny plugin adds vscode-like pictograms to neovim built-in lsp
    lspkind = {
      enable = true;
      cmp.enable = true;
    };
    # Previews incremental renaming
    inc-rename.enable = true;
    # Show function's signature when you type 
    lsp-signature.enable = true;
    # Define which LSP server to use for each language
    lsp-format.enable = true;

    # Language Servers
    lsp = {
      enable = true;

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
        # Java
        jdtls.enable = true;
        # Lua   
        lua_ls.enable = true;
        lua_ls.settings.telemetry.enable = false;

        # Nix lang
        nixd = {
          enable = true;
          settings = {
            formatting.command = [ "nixfmt" ];
            nixpkgs.expr = "import <nixpkgs> { }";

            options =
              let
                flake = ''(builtins.getFlake "${userSettings.dotfilesDir}")'';
              in
              {
                # Completitions for nixos, home manager and nixvim options
                nixos.expr = "${flake}.nixosConfigurations.${systemSettings.host}.options";
                home_manager.expr = "${flake}.homeConfigurations.${userSettings.username}.options";
                nixvim.expr = "${flake}.homeConfigurations.${userSettings.username}.options.programs.nixvim.type.getSubOptions []";
              };
          };
        };
      };
    };
  };
}
