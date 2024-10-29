{ userSettings, lib, ... }:
{
  imports = [
    ./cmp.nix
    ./harpoon.nix
    ./lsp.nix
    ./oil.nix
  ];

  programs.nixvim.plugins = {
    web-devicons.enable = true;

    lualine = lib.mkForce {
      enable = true;
      settings.options.theme =
        if (userSettings.theme == "nord") then userSettings.theme else "gruvbox_dark";
    };
    telescope.enable = true;

    nvim-colorizer.enable = true;

    lsp-format.enable = true;
    gitsigns.enable = true;
    nvim-autopairs.enable = true;
    comment.enable = true;
    which-key.enable = true;
    lazygit.enable = true;

    bufferline.enable = true;
    bufferline.settings.options.always_show_bufferline = false;

    # File explorer
    neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      enableRefreshOnWrite = true;
      window.autoExpandWidth = true;
      window.width = 30;
    };

    # syntax highlighting
    treesitter = {
      enable = true;
      settings = {
        auto_install = false;
        ensure_installed = [
          "c"
          "lua"
          "nix"
          "javascript"
          "typescript"
          "python"
          "rust"
          "bash"
          "java"
          "go"
        ];

        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
      };
    };

    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        float_opts = {
          border = "curved";
          height = 30;
          width = 130;
        };
      };
    };
  };
}
