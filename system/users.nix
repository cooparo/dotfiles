{
  userSettings,
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    users.enable = lib.mkEnableOption "Enables users";
  };

  config = lib.mkIf config.users.enable {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${userSettings.username} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      description = userSettings.username;
      extraGroups = [
        "networkmanager"
        "wheel"
        "kvm" # kvm is Kernel Virtual Machine, it's for hardware acceleration
      ];
    };
  };
}
