{ ... }:
{
  programs.nixvim.plugins = {
    lualine.enable = true;
    
    lsp = {
      enable = true;

      servers = {
        lua-ls.enable = true;
        lua-ls.settings.telemetry.enable = false;
      };
    };
  };
}