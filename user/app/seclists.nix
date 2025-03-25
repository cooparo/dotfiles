{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    seclists.enable = lib.mkEnableOption "Install seclists and create a symlink";
  };

  config = lib.mkIf config.seclists.enable {
    home = {
      packages = [ pkgs.seclists ];

      file."Documents/seclists" = {
        # target = "Document/seclists";
        source = "${pkgs.seclists}/share/wordlists/seclists";
      };
    };

  };
}
