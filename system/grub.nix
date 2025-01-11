{
  lib,
  config,
  ...
}:
{
  options = {
    grub.enable = lib.mkEnableOption "Enables grub";
  };

  config = lib.mkIf config.grub.enable {
    boot = {
      # Silent boot options
      # consoleLogLevel = 0;
      # kernelParams = [
      #   "quiet"
      #   "udev.log_level=3"
      # ];
      # initrd.verbose = false;

      # Uses GRUB bootloader
      # from https://github.com/mcdonc/.nixconfig/blob/master/videos/noboot/script.rst
      loader.grub = {
        enable = true;
        # This causes NixOS to only change any existing GRUB menu files,
        # but not to try to actually install the GRUB boot loader to any partition
        device = "nodev";
        efiInstallAsRemovable = true;
        efiSupport = true;
      };
    };
  };
}
