{ config, pkgs, userSettings, ... }:

{
    home.packages = [ pkgs.git ];

    programs.git = {
      enable = true;
      userName = "cooparo";
      userEmail = userSettings.email;
      extraConfig = {
        # core = {};
        pull = { rebase = "false"; };
        init.defaultBranch = "main";
      };
    };
}