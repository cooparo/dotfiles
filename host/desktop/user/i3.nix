{ lib, ... }:
let

  mod = "Mod4";

in
{
  xsession.windowManager.i3.config = {

    # Assign to second monitor workspace 2 
    workspaceOutputAssign = [
      {
        output = "HDMI-0";
        workspace = "2";
      }
    ];

    keybindings = lib.mkOptionDefault {
      # Cycle moving workspaces in different monitor
      "${mod}+Tab" = "move workspace to output next";
    };

    startup = [
      {
        command = "xrandr --output DP-2 --primary";
        always = false;
        notification = false;
      }
    ];
  };
}
