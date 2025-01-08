{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    openvpn.enable = lib.mkEnableOption "Enables openvpn";
  };

  config = lib.mkIf config.openvpn.enable {
    environment.systemPackages = [ pkgs.openvpn ];
    # openvpn fix to options error: --up script fails with '/etc/openvpn/update-resolv-conf': No such file or directory (errno=2)
    environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";
  };
}
