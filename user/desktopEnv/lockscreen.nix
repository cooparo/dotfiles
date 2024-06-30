{ pkgs, ... }:
{
  home.packages = with pkgs; [
    betterlockscreen
  ];

  services.betterlockscreen.enable = true;
}
