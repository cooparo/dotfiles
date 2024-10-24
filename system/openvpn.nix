{ pkgs, ... }:
{
  # openvpn fix to 
  # Options error: --up script fails with '/etc/openvpn/update-resolv-conf': No such file or directory (errno=2)
  environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";
}
