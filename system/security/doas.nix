{ lib, config, ... }:
{
  options = {
    doas.enable = lib.mkEnableOption "Enables doas";
  };

  config = lib.mkIf config.doas.enable {
    security = {
      sudo.enable = false;

      # Configure doas
      doas = {
        enable = true;
        extraRules = [
          {
            groups = [ "wheel" ];
            keepEnv = true;
            persist = true;
          }
        ];
      };
    };
  };
}
