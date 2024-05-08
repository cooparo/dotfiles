{ lib, systemSettings, ... }:
{
  networking.hostName = systemSettings.hostname; # Define your hostname.

  # Enables wireless support via wpa_supplicant.
  networking.wireless = {
    enable = lib.mkDefault false;

    networks.eduroam = {
      auth = ''
        ssid="eduroam"
        key_mgmt=WPA-EAP
        pairwise=CCMP
        group=CCMP TKIP
        eap=PEAP
        ca_cert="/home/paro/.config/cat_installer/ca.pem"
        identity="luca.parolini.2@studenti.unipd.it"
        altsubject_match="DNS:radius.ict.unipd.it"
        phase2="auth=MSCHAPV2"
        password="26miULBxpi9j"
      '';
    };
  }; 

  # Enable networking
  networking.networkmanager.enable = true;
}