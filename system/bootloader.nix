{ ... }:
{
  # Uses GRUB bootloader
  # from https://github.com/mcdonc/.nixconfig/blob/master/videos/noboot/script.rst

  boot.loader.grub.enable = true;
  # This causes NixOS to only change any existing GRUB menu files,
  # but not to try to actually install the GRUB boot loader to any partition
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.efiSupport = true;
}
