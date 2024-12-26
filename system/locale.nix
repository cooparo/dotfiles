{
  lib,
  config,
  systemSettings,
  ...
}:
with systemSettings;
{
  options = {
    locale.enable = lib.mkEnableOption "Enables locale";
  };

  config = lib.mkIf config.locale.enable {
    # Set your time zone.
    time.timeZone = timezone;

    # Select internationalisation properties.
    i18n.defaultLocale = locale;

    i18n.extraLocaleSettings = {
      LC_ADDRESS = locale;
      LC_IDENTIFICATION = locale;
      LC_MEASUREMENT = locale;
      LC_MONETARY = locale;
      LC_NAME = locale;
      LC_NUMERIC = locale;
      LC_PAPER = locale;
      LC_TELEPHONE = locale;
      LC_TIME = locale;

      # LANGUAGE = locale;
      # LC_ALL = locale;
    };
  };
}
