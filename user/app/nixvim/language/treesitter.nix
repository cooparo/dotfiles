{ ... }:
{
  # syntax highlight
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        auto_install = true;
        ensure_installed = [
          "bash"
          "c"
          "html"
          "css"
          "javascript"
          "jsdoc"
          "json"
          "lua"
          "luadoc"
          "luap"
          "nix"
          "rust"
          "java"
          "markdown"
          "markdown_inline"
          "python"
          "query"
          "regex"
          "tsx"
          "typescript"
          "vim"
          "vimdoc"
          "toml"
          "yaml"
          "ini"
        ];

        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
        indent.enable = true;

        incremental_selection = {
          enable = true;

          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            node_decremental = "<bs>";
            scope_incremental = false;
          };
        };
      };
    };

    treesitter-context.enable = true;
    comment.enable = true;
    ts-autotag.enable = true;
  };
}
