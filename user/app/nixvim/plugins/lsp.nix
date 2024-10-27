{ userSettings, ... }:
{ userSettings, pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
  ];

  programs.nixvim.plugins.lsp = {
    enable = true;

    servers = {
      pylsp = {
	enable = true;
	settings.configurationSources = "flake8";
      };

      lua-ls.enable = true;
      lua-ls.settings.telemetry.enable = false;

      # Nix lang
      nixd = {
        enable = true;
        settings = {
          formatting.command = [ "nixfmt" ];
          nixpkgs.expr = "import <nixpkgs> { }";

          # Completitions for nixos and home manager options
          options.nixos.expr = "(builtins.getFlake ${userSettings.dotfilesDir}).nixosConfigurations.CONFIGNAME.options";
          options.home_manager.expr = "(builtins.getFlake ${userSettings.dotfilesDir}).homeConfigurations.CONFIGNAME.options";
        };
      };

      # C/C++
      clangd.enable = true;
    };
  };
}
