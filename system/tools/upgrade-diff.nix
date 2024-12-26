{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    upgrade-diff.enable = lib.mkEnableOption "Enables showing package's upgrade differences";
  };
  config = lib.mkIf config.upgrade-diff.enable {
    system.activationScripts.diff = {
      supportsDryActivation = true;
      text = ''
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
      '';
    };
  };
}
