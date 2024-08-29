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
	frame_color = "#${base04}";
	frame_width = 0;
	corner_radius = 5;
	gap_size = 3;
      };
    };
  };
}
