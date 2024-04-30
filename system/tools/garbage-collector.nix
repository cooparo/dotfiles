{ ... }:
{

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
  nix.optimise.dates = [ "03:45" ]; # Optional; allows customizing optimisation schedule
}