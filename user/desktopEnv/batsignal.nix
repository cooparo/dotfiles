{ config, lib, ... }:
{
  options = {
    batsignal.enable = lib.mkEnableOption "Enables batsignal";
  };

  config = lib.mkIf config.batsignal.enable {
    services.batsignal = {
      enable = true;
      extraArgs = [
        "-e"
        "-w"
        "30"
        "-c"
        "15"
        "-d"
        "10"
      ];
    };
  };
}
