{ ... }:
{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;

    settings = {
      indent = {
        char = "│"; # "│" or "▎"
      };

      scope.enabled = true;

      exclude = {
        buftypes = [
          "terminal"
          "nofile"
        ];
        filetypes = [
          "help"
          "alpha"
          "dashboard"
          "neo-tree"
          "Trouble"
          "trouble"
          "lazy"
          "mason"
          "notify"
          "toggleterm"
          "lazyterm"
          "nvterm"
        ];
      };
    };
  };
}
