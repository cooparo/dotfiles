{
  config,
  lib,
  userSettings,
  ...
}:
{
  options = {
    docker.enable = lib.mkEnableOption "Enables docker";
  };

  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;

    users.users.${userSettings.username}.extraGroups = [ "docker" ];
  };
}
