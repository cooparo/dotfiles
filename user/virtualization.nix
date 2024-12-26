{ lib, config, ... }:
{
  options = {
    virtualization.enable = lib.mkEnableOption "Enables virtualization";
  };

  config = lib.mkIf config.virtualization.enable {
    # NOTE: enable autoconnections fro qemu
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
