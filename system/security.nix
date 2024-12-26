{ lib, config, ... }:
{
  options = {
    security.enable = lib.mkEnableOption "Enables security";
  };

  config = lib.mkIf config.security.enable {
    security = {
      sudo.enable = false;

      # Configure doas
      doas.enable = true;
      doas.extraRules = [
        {
          groups = [ "wheel" ];
          keepEnv = true;
          persist = true;
        }
      ];

      polkit.enable = true;
    };
  };
}
