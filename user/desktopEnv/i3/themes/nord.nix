{ ... }:

let 
    text = "#FFFFFF";
    focused = "#EBCB8B";
    inactive = "#3B4252";
    unfocused = "#2E3440";
    urgent = "#BF616A";

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
            text = "5E81AC";
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