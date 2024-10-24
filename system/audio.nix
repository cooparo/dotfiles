{ userSettings, ... }:
{
  security.rtkit.enable = true;
  users.users.${userSettings.username}.extraGroups = [ "audio" ];

  hardware.pulseaudio.enable = false;
  hardware.pulseaudio.support32Bit = true;
}
