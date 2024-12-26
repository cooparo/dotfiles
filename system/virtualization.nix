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
    virtualisation.libvirtd.enable = true;
    users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];

    environment.systemPackages = with pkgs; [
      qemu
      virt-manager
      libvirt
    ];
  };
}
