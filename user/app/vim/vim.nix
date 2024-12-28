{ config, lib, ... }:
{
  options = {
    vim.enable = lib.mkEnableOption "Enables vim";
  };

  config = lib.mkIf config.vim.enable {
    programs.vim = {
      enable = true;
      extraConfig = builtins.readFile ./vimrc;
    };
  };
}
