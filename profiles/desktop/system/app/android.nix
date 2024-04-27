{ userSettings, ... }:
{
  # Hardware acceleration (for android development)
  users.users.${userSettings.username}.extraGroups = [ "kvm"];
}