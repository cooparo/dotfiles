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
        "application/pdf" = [
          "org.pwmt.zathura-pdf-mupdf.desktop"
        ];
      };
    };
  };
}
