{ lib, ... }:
{
  imports = [
    ./mime-app.nix
    ./alacritty.nix
    ./git.nix
    ./megasync.nix
    ./redshift.nix
    ./ssh.nix
    ./tmux.nix
    ./zsh.nix
    ./seclists.nix
    ./nvim/neovim.nix
    ./vim/vim.nix
  ];

  mime-app.enable = lib.mkDefault true;
  alacritty.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  megasync.enable = lib.mkDefault true;
  redshift.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  vim.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  seclists.enable = lib.mkDefault true;

  neovim.enable = lib.mkDefault true;
}
