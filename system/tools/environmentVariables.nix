{
  config,
  lib,
  userSettings,
  ...
}:
with config.lib.stylix.colors;
let
  BASE00 = "#${base00}";
  BASE01 = "#${base01}";
  BASE02 = "#${base02}";
  BASE03 = "#${base03}";
  BASE04 = "#${base04}";
  BASE05 = "#${base05}";
  BASE06 = "#${base06}";
  BASE07 = "#${base07}";
  BASE08 = "#${base08}";
  BASE09 = "#${base09}";
  BASE0A = "#${base0A}";
  BASE0B = "#${base0B}";
  BASE0C = "#${base0C}";
  BASE0D = "#${base0D}";
  BASE0E = "#${base0E}";
  BASE0F = "#${base0F}";

in
{
  options = {
    environmentVariables.enable = lib.mkEnableOption "Enables environment variables";
  };

  config = lib.mkIf config.environmentVariables.enable {
    environment.sessionVariables = with userSettings; {
      ETH_INTERFACE = eth-interface;
      WIFI_INTERFACE = wifi-interface;
      INTERFACE = if (wifi-interface == "") then eth-interface else wifi-interface;

      inherit BASE00;
      inherit BASE01;
      inherit BASE02;
      inherit BASE03;
      inherit BASE04;
      inherit BASE05;
      inherit BASE06;
      inherit BASE07;
      inherit BASE08;
      inherit BASE09;
      inherit BASE0A;
      inherit BASE0B;
      inherit BASE0C;
      inherit BASE0D;
      inherit BASE0E;
      inherit BASE0F;
    };
  };
}
