{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cpplint
    golangci-lint
    statix
    selene
    python312Packages.flake8
    eslint_d
    nodePackages.jsonlint
    checkstyle
    hlint
    shellcheck
  ];

  programs.nixvim.plugins.lint = {
    enable = true;

    lintersByFt = {
      c = [ "cpplint" ];
      cpp = [ "cpplint" ];
      go = [ "golangci-lint" ];
      nix = [ "statix" ];
      lua = [ "selene" ];
      python = [ "flake8" ];
      javascript = [ "eslint_d" ];
      javascriptreact = [ "eslint_d" ];
      typescript = [ "eslint_d" ];
      typescriptreact = [ "eslint_d" ];
      json = [ "jsonlint" ];
      java = [ "checkstyle" ];
      haskell = [ "hlint" ];
      bash = [ "shellcheck" ];
    };
  };
}
