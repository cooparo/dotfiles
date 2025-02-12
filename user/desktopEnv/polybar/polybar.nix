{
  pkgs,
  userSettings,
  config,
  lib,
  ...
}:
let
  get_spotify_status = # bash
    ''
      #!/usr/bin/env ${pkgs.bash}/bin/bash

      # The name of polybar bar which houses the main spotify module and the control modules.
      PARENT_BAR="main"
      PARENT_BAR_PID=$(${pkgs.toybox}/bin/pgrep -a "polybar" | ${pkgs.gnugrep}/bin/grep "$PARENT_BAR" | ${pkgs.toybox}/bin/cut -d" " -f1)

      # Set the source audio player here.
      # Players supporting the MPRIS spec are supported.
      # Examples: spotify, vlc, chrome, mpv and others.
      # Use `playerctld` to always detect the latest player.
      # See more here: https://github.com/altdesktop/playerctl/#selecting-players-to-control
      PLAYER="spotify"

      # Format of the information displayed
      # Eg. {{ artist }} - {{ album }} - {{ title }}
      # See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
      FORMAT="{{ title }} - {{ artist }}"

      # Sends $2 as message to all polybar PIDs that are part of $1
      update_hooks() {
          while IFS= read -r id
          do
              polybar-msg -p "$id" hook spotify-play-pause $2 1>/dev/null 2>&1
          done < <(echo "$1")
      }

      PLAYERCTL_STATUS=$(${pkgs.playerctl}/bin/playerctl --player=$PLAYER status 2>/dev/null)
      EXIT_CODE=$?

      if [ $EXIT_CODE -eq 0 ]; then
          STATUS=$PLAYERCTL_STATUS
      else
          STATUS=""
      fi

      if [ "$1" == "--status" ]; then
          echo "$STATUS"
      else
          if [ "$STATUS" = "Stopped" ]; then
              echo "No music is playing"
          elif [ "$STATUS" = "Paused"  ]; then
              update_hooks "$PARENT_BAR_PID" 2
              ${pkgs.playerctl}/bin/playerctl --player=$PLAYER metadata --format "$FORMAT"
          elif [ "$STATUS" = ""  ]; then
              echo "$STATUS"
          else
              update_hooks "$PARENT_BAR_PID" 1
              ${pkgs.playerctl}/bin/playerctl --player=$PLAYER metadata --format "$FORMAT"
          fi
      fi

          	'';
in
{
  options = {
    polybar.enable = lib.mkEnableOption "Enables polybar";
  };

  config = lib.mkIf config.polybar.enable {

    # NOTE: kill polybar: polybar-msg cmd quit
    services.polybar = with config.colorScheme.palette; {
      enable = true;

      package = pkgs.polybar.override {
        i3Support = true;
        alsaSupport = true;
        pulseSupport = true;
      };

      script = ''
        polybar-msg cmd quit

        echo "---" | tee -a /tmp/polybar.log 
        polybar main 2>&1 | tee -a /tmp/polybar.log & disown
        polybar secondary 2>&1 | tee -a /tmp/polybar.log & disown
      '';

      extraConfig = ''
                        include-directory = ${userSettings.dotfilesDir}/user/desktopEnv/polybar/forest/ 

        				[color]
        				background = #${base00}
        				foreground = #${base04}
        				sep = #${base0D}

        				white = #${base06}
        				black = #${base00}
        				red = #${base08}
        				pink = #EC407A
        				purple = #${base0E}
        				blue = #${base0D}
        				cyan = #${base0C}
        				teal = #00B19F
        				green = #${base0B}
        				lime = #B9C244
        				yellow = #${base0A}
        				orange = #${base09}
        				indigo = #6C77BB
        				gray = #${base04}
        				blue-gray = #6D8895
      '';

    };

    home.file = {
      # Install Feather font
      ".local/share/fonts/feather.ttf".source = ./forest/font/feather.ttf;

      ".local/bin/get_spotify_status.sh" = {
        text = get_spotify_status;
        executable = true;
      };
    };

  };
}
