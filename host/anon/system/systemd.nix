{ pkgs, ... }:
{
  systemd.timers."low-battery-notification" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "low-battery-notification.service";
    };
  };

  systemd.services."low-battery-notification" = {
    description = "Low Battery Notfication: check battery state every 5 min";
    script = ''
	  #!/usr/bin/env ${pkgs.bash}

	  # Flag file to track if the notification has already been sent
	  NOTIFY_SENT_FLAG="/tmp/battery_low_notify_sent"

	  # Function to check battery status and send notification
	  check_battery() {
	      # Get battery percentage using `acpi` command (you may need to install acpi)
	      BATTERY_PERCENTAGE=$(${pkgs.acpi}/bin/acpi -b | grep -P -o '[0-9]+(?=%)')

	      # If battery percentage is less than 10%
	      if [ "$BATTERY_PERCENTAGE" -lt 10 ]; then
		  # Check if the notification has already been sent
		  if [ ! -f "$NOTIFY_SENT_FLAG" ]; then
		      # Send a notification
		      ${pkgs.libnotify}/bin/notify-send -u critical "Battery Low" "Battery level is under 10%. Plug in your charger!"

		      # Create the flag file to prevent further notifications
		      touch "$NOTIFY_SENT_FLAG"
		  fi
	      else
		  # If battery is above 10%, remove the flag file (if it exists)
		  if [ -f "$NOTIFY_SENT_FLAG" ]; then
		      rm "$NOTIFY_SENT_FLAG"
		  fi
	      fi
	  }

	  # Call the function to check battery
	  check_battery
      '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
