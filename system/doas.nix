{ ... }:
{
  security.sudo.enable = false;

  # Configure doas
  security.doas.enable = true;
  security.doas.extraRules = [{
    groups = [ "weel" ];
    keepEnv = true;
    persist = true;  #TODO: fix non persist un cazzo
  }];
}