{ lib, ... }:
{
  imports = [
    ./garbage-collector.nix
    ./upgrade-diff.nix
  ];

  garbage-collector.enable = lib.mkDefault true;
  upgrade-diff.enable = lib.mkDefault true;
}
