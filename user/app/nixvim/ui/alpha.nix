{
  programs.nixvim.plugins.alpha =
    let
      nixFlake = [
        "                                                      "
        "░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░ ░▒▓██████▓▒░  "
        "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ "
        "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ "
        "░▒▓███████▓▒░░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░ "
        "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ "
        "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ "
        "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░  "
        "                                                      "
        "          from git@github.com:cooparo"
      ];

      padding = val: {
        type = "padding";
        inherit val;
      };
    in
    {
      enable = true;

      layout = [
        (padding 4)
        {
          opts = {
            hl = "AlphaHeader";
            position = "center";
          };
          type = "text";
          val = nixFlake;
        }
        (padding 2)
        {
          type = "button";
          val = "  Find File";
          on_press = {
            __raw = "function() require('telescope.builtin').find_files() end";
          };
          opts = {
            # hl = "comment";
            keymap = [
              "n"
              "f"
              ":Telescope find_files <CR>"
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
            shortcut = "f";

            position = "center";
            cursor = 3;
            width = 38;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        }
        (padding 1)
        {
          type = "button";
          val = "󰈚  Recent Files";
          on_press = {
            __raw = "function() require('telescope.builtin').oldfiles() end";
          };
          opts = {
            # hl = "comment";
            keymap = [
              "n"
              "r"
              ":Telescope oldfiles <CR>"
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
            shortcut = "r";

            position = "center";
            cursor = 3;
            width = 38;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        }
        (padding 1)
        {
          type = "button";
          val = "󰈭  Find Word";
          on_press = {
            __raw = "function() require('telescope.builtin').live_grep() end";
          };
          opts = {
            # hl = "comment";
            keymap = [
              "n"
              "g"
              ":Telescope live_grep <CR>"
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
            shortcut = "g";

            position = "center";
            cursor = 3;
            width = 38;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        }
        (padding 1)
        {
          type = "button";
          val = "  LazyGit";
          on_press = {
            __raw = "function() vim.cmd('LazyGit') end";
          };
          opts = {
            # hl = "comment";
            keymap = [
              "n"
              "l"
              ":LazyGit<CR>"
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
            shortcut = "l";

            position = "center";
            cursor = 3;
            width = 38;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        }
        (padding 1)
        {
          type = "button";
          val = "  Todos";
          on_press = {
            __raw = "function() require('telescope.builtin').find_files() end";
          };
          opts = {
            # hl = "comment";
            keymap = [
              "n"
              "t"
              ":TodoTelescope keywords=TODO,FIX<CR>"
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
            shortcut = "t";

            position = "center";
            cursor = 3;
            width = 38;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        }
        (padding 1)
        {
          type = "button";
          val = "  Quit Neovim";
          # on_press = {
          #   __raw = "function() require('telescope.builtin').find_files() end";
          # };
          opts = {
            # hl = "comment";
            keymap = [
              "n"
              "q"
              ":qa<CR>"
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
            shortcut = "q";

            position = "center";
            cursor = 3;
            width = 38;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        }
      ];
    };
}
