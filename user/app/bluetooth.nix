{ pkgs, ... }:
{

  # TODO: FIX Using Bluetooth headset buttons to control media player 
  # check https://nixos.wiki/wiki/Bluetooth

  # From https://nixos.wiki/wiki/Bluetooth
  # Using Bluetooth headset buttons to control media player

  # systemd.user.services.mpris-proxy = {
  #   description = "Mpris proxy";
  #   after = [ "network.target" "sound.target" ];
  #   wantedBy = [ "default.target" ];
  #   serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  # };
}
