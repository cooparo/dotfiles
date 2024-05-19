{ lib, systemSettings, userSettings, ... }:
let

  mod = "Mod4";

in {
  xsession.windowManager.i3.config = {
    
    window.hideEdgeBorders = "smart";

    keybindings = lib.mkOptionDefault {

    };  

    startup = [

    ];
  };
}