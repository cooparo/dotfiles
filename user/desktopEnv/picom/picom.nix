{ ... }:
{
  #services.picom.enable = true;

  home.file.".config/picom/picom.conf" = {
    source = ./picom.conf;
    target = ".config/picom/picom.conf";
  };
}