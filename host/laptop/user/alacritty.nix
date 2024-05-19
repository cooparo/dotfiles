{ lib, config, userSettings, ...}: 
{
  programs.alacritty = {
      settings.font.size = lib.mkForce 7;    
  };
}
