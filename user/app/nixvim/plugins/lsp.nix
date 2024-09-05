{ ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;

    servers = {
      pylsp.enable = true;

      lua-ls.enable = true;
      lua-ls.settings.telemetry.enable = false;

      # Nix lang
      nixd.enable = true;

      # C/C++
      clangd.enable = true;
    };
  };
}
