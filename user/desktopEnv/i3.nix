{
  lib,
  userSettings,
  config,
  pkgs,
  ...
}:
let
  mod = "Mod4";

  # Colorscheme
  inherit (config.colorScheme) palette;

  text = "#${palette.base06}";
  focused = "#${palette.base0C}";
  inactive = "#${palette.base02}";
  unfocused = "#${palette.base00}";
  urgent = "#${palette.base08}";

  wallpaperURL = builtins.readFile ../../themes/${userSettings.theme}/bg-url.txt;
  wallpaperSHA256 = builtins.readFile ../../themes/${userSettings.theme}/bg-sha256.txt;
  wallpaper = pkgs.fetchurl {
    url = wallpaperURL;
    hash = wallpaperSHA256;
  };
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod; # Windows button
      defaultWorkspace = "workspace number 1";
      terminal = userSettings.term;
      focus.followMouse = false;
      bars = [ ];
      menu = "${pkgs.rofi-power-menu}/bin/rofi-power-menu";

      window.titlebar = false;

      gaps = {
        inner = 5;
        outer = 2;
        smartGaps = true;
      };

      floating.criteria = [
        { title = "Bitwarden"; }
        { class = "gnome-calculator"; }
      ];

      # Start up command
      startup = [
        # Picom
        {
          command = "${pkgs.picom}/bin/picom -b --config ${userSettings.dotfilesDir}/user/desktopEnv/picom/picom.conf";
          always = true;
          notification = false;
        }
        # Polybar
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.autotiling}/bin/autotiling &";
          always = true;
          notification = false;
        }
        {
          command = "ssh-add ~/.ssh/github";
          always = false;
          notification = false;
        }
        # Polkit authentication
        {
          command = "exec ${pkgs.lxsession}/bin/lxsession";
          always = false;
          notification = false;
        }
        {
          command = "exec ${pkgs.betterlockscreen}/bin/betterlockscreen -q -u ${wallpaper}";
          always = false;
          notification = false;
        }
      ];

      keybindings = lib.mkOptionDefault {
        "${mod}+t" = "exec thunar";
        "Print" = "exec flameshot gui";
        "${mod}+d" = "exec rofi -show drun";
        "${mod}+p" = "exec rofi -show power-menu -modi power-menu:rofi-power-menu";
        "${mod}+o" = "exec rofi -show window";

        # Lockscreen
        "${mod}+l" = "exec betterlockscreen -q -l blur";

        # Audio
        "XF86AudioMute" = "exec amixer sset Master toggle";
        "XF86AudioRaiseVolume" = "exec amixer sset Master 10%+";
        "XF86AudioLowerVolume" = "exec amixer sset Master 10%-";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPlay" = "exec playerctl play-pause";

        # Brightness
        "XF86MonBrightnessUp" = "exec brightnessctl set 10%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";
      };

      colors = {
        focused = {
          border = focused;
          background = focused;
          text = unfocused;
          indicator = focused;
          childBorder = focused;
        };

        focusedInactive = {
          border = inactive;
          background = inactive;
          inherit text;
          indicator = inactive;
          childBorder = inactive;
        };
        unfocused = {
          border = unfocused;
          background = unfocused;
          text = inactive;
          indicator = unfocused;
          childBorder = unfocused;
        };
        urgent = {
          border = urgent;
          background = urgent;
          inherit text;
          indicator = urgent;
          childBorder = urgent;
        };
      };
    };
  };
}
