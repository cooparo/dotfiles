{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}:
{
  options = {
    virtualization.enable = lib.mkEnableOption "Enables virtualization";
  };

  config = lib.mkIf config.virtualization.enable {
    # NOTE: you get "Error starting domain: Request operations is not valid:
    # network 'default' is not active", run:
    # virsh net-list --all # to check networks active
    # and
    # virsh net-start default # to start the network
    # virsh net-autostart default # to mark it for autostart 
    # check also https://nixos.wiki/wiki/Virt-manager

    programs.virt-manager.enable = true;

    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];
    users.groups.libvirtd.members = [ userSettings.username ];
  };
}
