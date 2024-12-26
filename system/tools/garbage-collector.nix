{ lib, config, ... }:
{

  options = {
    garbage-collector.enable = lib.mkEnableOption "Enables garbage collector";
  };

  config = lib.mkIf config.garbage-collector.enable {
    # Some scheduled spring cleaning
    # from https://nixos.wiki/wiki/Storage_optimization

    # Garbage collector
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    # Optimising the store
    nix.optimise.automatic = true;
    nix.optimise.dates = [ "weekly" ]; # Optional; allows customizing optimisation schedule
  };
}
