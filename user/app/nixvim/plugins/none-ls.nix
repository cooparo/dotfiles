{ pkgs, ... }:
{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings = {
      updateInInsert = false;
    };
    sources = {
      code_actions = {
        # gitsigns.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = true;
      };
      formatting = {
        nixfmt = {
          enable = true;
          package = pkgs.nixfmt-rfc-style;
        };
        black = {
          enable = true;
          settings = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
          settings = ''
            {
              extra_args = { "--no-semi", "--single-quote" },
            }
          '';
        };
      };
    };
  };
}
