{ lib, config, ... }:
{
  options = {
    virtualization.enable = lib.mkEnableOption "Enables virtualization";
  };

  config = lib.mkIf config.virtualization.enable {
    # NOTE: enables autoconnections from qemu
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
