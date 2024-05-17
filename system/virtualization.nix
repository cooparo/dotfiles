{ userSettings, ... }:
{
  virtualisation.libvirtd.enable = true;
  users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];
}
