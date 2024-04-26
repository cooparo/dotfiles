{ userSettings, ... }:
{
  programs.nixvim.plugins = {

    lualine.enable = true;
    lualine.theme = userSettings.theme;

    # telescope.enable = true;
    
    lsp = {
      enable = true;

      servers = {

        lua-ls.enable = true;
        lua-ls.settings.telemetry.enable = false;

        # Nix lang
        nixd.enable = true;
        nixd.autostart = true;

        # C/C++
        clangd.enable = true;
        clangd.autostart = true;

      };
    };
  };
}