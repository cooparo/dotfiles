{ lib, ... }:
{
  imports = [
    ./garbage-collector.nix
    ./upgrade-diff.nix
    ./environmentVariables.nix
  ];

  garbage-collector.enable = lib.mkDefault true;
  upgrade-diff.enable = lib.mkDefault true;
  environmentVariables.enable = lib.mkDefault true;
}
