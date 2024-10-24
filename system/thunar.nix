{ pkgs, ... }:
{
  # xfce configuration are discarded without this
  programs.xfconf.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # Tumbnail support for images
  services.tumbler.enable = true;
}
