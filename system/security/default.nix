{ lib, ... }:
{
  imports = [
    ./security.nix
    ./ssh.nix
  ];

  security.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
}
