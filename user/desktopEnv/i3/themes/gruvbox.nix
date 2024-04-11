{ ... }:

let 
    text = "#FFFFFF";
    focused = "#689D6A";
    inactive = "#504945";
    unfocused = "#282828";
    urgent = "#FB4934";

in {
    xsession.windowManager.i3.config.colors = {
        focused = {
            border = focused;
            background = focused;
            text = text;
            indicator = focused;
            childBorder = focused;
        };

        focusedInactive = {
            border = inactive;
            background = inactive;
            text = text;
            indicator = inactive;
            childBorder = inactive;
        };
        unfocused = {
            border = unfocused;
            background = unfocused;
            text = "BDAE93";
            indicator = unfocused;
            childBorder = unfocused;
        };
        urgent = {
            border = urgent;
            background = urgent;
            text = text;
            indicator = urgent;
            childBorder = urgent;
        };
    };
}