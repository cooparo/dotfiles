{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    zsh.enable = lib.mkEnableOption "Enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
    # I use zsh btw
    environment.shells = [ pkgs.zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;
  };
}
