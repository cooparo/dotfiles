{ userSettings, ... }:
{
  security.rtkit.enable = true;
  users.users.${userSettings.username}.extraGroups = [ "audio" ];
  
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
}
