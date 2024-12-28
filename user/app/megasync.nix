{ config, lib, ... }:
{
  options = {
    megasync.enable = lib.mkEnableOption "Enables megasync";
  };

  config = lib.mkIf config.megasync.enable {
    services.megasync.enable = true;
  };
}
