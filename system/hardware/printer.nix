{ config, lib, ... }:
{
  options = {
    printer.enable = lib.mkEnableOption "Enables printer";
  };

  config = lib.mkIf config.printer.enable {
    # Got from https://nixos.wiki/wiki/Printing

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enables autodiscovery of network printers
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
