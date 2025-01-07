{ lib, ... }:
{
  imports = [
    ./nix.nix
  ];

  nix-conf.enable = lib.mkDefault true;
}
