{ lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./megasync.nix
    ./redshift.nix
    ./ssh.nix
    ./tmux.nix
    ./nixvim/nixvim.nix
    ./vim/vim.nix
    ./zsh.nix
  ];

  alacritty.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  megasync.enable = lib.mkDefault true;
  redshift.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  nixvim.enable = lib.mkDefault true;
  vim.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
