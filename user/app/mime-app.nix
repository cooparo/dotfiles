{
  config,
  lib,
  ...
}:
{
  options = {
    mime-app.enable = lib.mkEnableOption "Enables mime default apps";
  };

  config = lib.mkIf config.mime-app.enable {

    xdg.enable = true;
    xdg.mimeApps = {
      enable = true;

      defaultApplications = {
        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";

        "text/html" = "brave-browser.desktop";
        "text/md" = "gnome-text-editor.desktop";

        "x-scheme-handler/http" = "brave-browser.desktop";
        "x-scheme-handler/https" = "brave-browser.desktop";
        "x-scheme-handler/about" = "brave-browser.desktop";
        "x-scheme-handler/unknown" = "brave-browser.desktop";
        "x-scheme-handler/mailto" = "brave-browser.desktop";

        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
        "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";

        "image/jpeg" = "org.gnome.Loupe.desktop";
        "image/png" = "org.gnome.Loupe.desktop";
        "image/xcf" = "gimp.desktop";

        "video/mkv" = "vlc.desktop";
      };
    };
  };
}
