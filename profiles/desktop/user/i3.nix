{ lib, systemSettings, userSettings, ... }:
let

  mod = "Mod4";

in {
  xsession.windowManager.i3.config = {

    # Assign to second monitor workspace 2 
    workspaceOutputAssign = [
      { output = "HDMI-0"; workspace = "2"; }
    ];

    keybindings = lib.mkOptionDefault {
      "${mod}+space" = "exec ${userSettings.dotfilesDir}/user/scripts/kb-itus-toggle.sh";
      
    };  

    startup = [

    ];
  };
}