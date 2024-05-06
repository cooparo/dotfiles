{ ... }:
{
  security.sudo.enable = false;

  # Configure doas
  security.doas.enable = true;
  security.doas.extraRules = [{
    groups = [ "wheel" ];
    keepEnv = true;
    persist = true;
  }];
}