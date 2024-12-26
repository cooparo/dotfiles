{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    dunst.enable = lib.mkEnableOption "Enables dunst";
  };

  config = lib.mkIf config.dunst.enable {
    services.dunst = {
      enable = true;
      package = pkgs.dunst;

      iconTheme = {
        package = pkgs.qogir-icon-theme;
        name = "Qogir-dark";

      };

      settings = {
        global = with config.colorScheme.palette; {
          font = "DejaVu Sans 12";
          width = 400;
          height = "(0,400)";
          offset = "20x50";
          transparency = 3;
          notification_limit = 5;
          frame_color = "#${base0E}";
          background = "#${base00}";
          foreground = "${base06}";
          frame_width = 3;
          corner_radius = 3;
          gap_size = 3;
        };

        urgency_low = with config.colorScheme.palette; {
          frame_color = "#${base0B}";
        };

        urgency_critical = with config.colorScheme.palette; {
          frame_color = "#${base08}";
        };
      };
    };
  };
}
