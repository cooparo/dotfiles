{ pkgs, config, ... }:
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    settings = {
      global = with config.colorScheme.palette; {
	width = 300;
	height = 300;
	offset = "30x50";
	transparency = 10;
	notification_limit = 5;
	frame_color = "#${base04}";
      };
    };
  };
}
