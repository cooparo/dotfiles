{ lib, config, ... }:
{
  options = {
    ssh.enable = lib.mkEnableOption "Enables ssh";
  };

  config = lib.mkIf config.ssh.enable {
    programs.ssh.startAgent = true;

    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.PermitRootLogin = "no";
    };
  };
}
