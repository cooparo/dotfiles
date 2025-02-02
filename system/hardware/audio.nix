{
  userSettings,
  lib,
  config,
  ...
}:
{
  options = {
    audio.enable = lib.mkEnableOption "Enables audio";
  };

  config = lib.mkIf config.audio.enable {
    security.rtkit.enable = true;
    users.users.${userSettings.username}.extraGroups = [ "audio" ];

    #TODO: add some infos.
    # Why pulseaudio is disabled?
    services.pulseaudio.enable = false;
    services.pulseaudio.support32Bit = true;
  };
}
