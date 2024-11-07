{ userSettings, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = userSettings.kbLayout;
  };
}
