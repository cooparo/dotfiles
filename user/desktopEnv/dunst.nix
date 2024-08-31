{ pkgs, config, ... }:
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    settings = {
      global = with config.colorScheme.palette; {
	width = 300;
	height = 300;
	offset = "20x50";
	transparency = 5;
	notification_limit = 5;
	frame_color = "#${base0E}";
	background = "#${base02}";
	foreground = "#${base07}";
	frame_width = 1;
	corner_radius = 5;
	gap_size = 3;
      };

      urgency_low = with config.colorScheme.palette; {
	frame_color = "#${base02}";
      };

      urgency_critical = with config.colorScheme.palette; {
	frame_color = "#${base08}";
	background = "#${base08}";
      };
    };
  };
}
