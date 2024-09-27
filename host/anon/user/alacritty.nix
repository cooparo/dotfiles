{ lib, ...}: 
{
  programs.alacritty = {
      settings.font.size = lib.mkForce 6;    
  };
}
