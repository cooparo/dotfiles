{
  lib,
  config,
  ...
}:
{
  # TODO: change name from "bootloader" to "grub"
  options = {
    bootloader.enable = lib.mkEnableOption "Enables bootloader";
  };

  config = lib.mkIf config.bootloader.enable {
    # Should remove the logging in the boot phase
    boot.consoleLogLevel = 0;

    # Uses GRUB bootloader
    # from https://github.com/mcdonc/.nixconfig/blob/master/videos/noboot/script.rst
    boot.loader.grub = {
      enable = true;
      # This causes NixOS to only change any existing GRUB menu files,
      # but not to try to actually install the GRUB boot loader to any partition
      device = "nodev";
      efiInstallAsRemovable = true;
      efiSupport = true;
    };
  };
}
