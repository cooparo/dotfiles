{ pkgs-stable, nixpkgs, ... }:
{
  home.packages = with pkgs-stable; [
    etcher
  ];
}