{ lib, systemSettings, ... }:
let

  mod = "Mod4";

in {
  xsession.windowManager.i3.config = {

    keybindings = lib.mkOptionDefault {
      
    };  

    startup = [

    ];
  };
}