{
  # syntax highlight
  programs.nixvim.plugins = {
    treesitter-context.enable = true;
    comment.enable = true;
    ts-autotag.enable = true;

    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        auto_install = true;
        highlight.enable = true;
        indent.enable = true;

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
  };
}
