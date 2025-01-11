{ lib, ... }:
{
  imports = [
    ./doas.nix
    ./ssh.nix
  ];

  doas.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
}
