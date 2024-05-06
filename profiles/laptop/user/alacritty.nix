{ lib, config, userSettings, ...}: 
{
  #TODO: controlla che anche il desktop usi il fontsize giusto
  # e se è normale fai ovverride
  programs.alacritty = {
      settings.font.size = lib.mkForce 7;    
  };
}
