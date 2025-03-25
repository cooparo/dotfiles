{
  pkgs,
  userSettings,
  lib,
  config,
  ...
}:
{
  options = {
    wireshark.enable = lib.mkEnableOption "Enables wireshark";
  };
  config = lib.mkIf config.wireshark.enable {
    programs.wireshark = {
      enable = true;
      # package = pkgs.wireshark; # default is wireshark-cli
    };

    users.users.${userSettings.username}.extraGroups = [ "wireshark" ];
  };
}
