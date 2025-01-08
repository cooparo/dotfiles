{
  config,
  lib,
  inputs,
  ...
}:
{
  options = {
    nix-conf.enable = lib.mkEnableOption "Enables nix settings and flakes";
  };

  config = lib.mkIf config.nix-conf.enable {
    nix = {
      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      settings.warn-dirty = false;
    };
  };
}
