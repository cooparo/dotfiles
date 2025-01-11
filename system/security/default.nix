{ lib, ... }:
{
  imports = [
    ./doas.nix
    ./ssh.nix
    ./polkit.nix
  ];

  doas.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
  polkit.enable = lib.mkDefault true;
}
