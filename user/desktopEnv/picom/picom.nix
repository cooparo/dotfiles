{ ... }:
{
  #services.picom.enable = true;
  # TODO: use builtins.readFile
  #       stop using home.file and impure path
  home.file.".config/picom/picom.conf" = {
    source = ./picom.conf;
    target = ".config/picom/picom.conf";
  };
}