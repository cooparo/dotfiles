{ pkgs, ... }:
{
  home.packages = with pkgs; [
    betterlockscreen
  ];

  services.betterlockscreen = {
    enable = true;
    arguments = [ "blur" ];
    inactiveInterval = 20;
  };
}
