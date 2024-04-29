{ userSettings, config, ... }:

let

    font = builtins.elemAt userSettings.nerdfonts 0; # First element of fonts list
    size = toString userSettings.fontSize;
    color = config.colorScheme.palette;

    # taken from https://github.com/lr-tech/rofi-themes-collection 
    theme = builtins.toFile "rofi-theme.rasi" ''
        * {

            base0:     #${color.base00};
            base1:     #${color.base01};
            base2:     #${color.base02};
            base3:     #${color.base03};

            base4:     #${color.base04};
            base5:     #${color.base05};
            base6:     #${color.base06};

            base7:     #${color.base07};
            base8:     #${color.base0C};
            base9:     #${color.base0D};
            base10:    #${color.base0F};
            base11:    #${color.base08};

            base12:    #${color.base09};
            base13:    #${color.base0A};
            base14:    #${color.base0B};
            base15:    #${color.base0E};

            background-color:   transparent;
            text-color:         @base4;
            accent-color:       @base8;

            margin:     0px;
            padding:    0px;
            spacing:    0px;
        }

        window {
            background-color:   @base0;
            border-color:       @accent-color;

            location:   center;
            width:      480px;
            border:     1px;
        }

        inputbar {
            padding:    8px 12px;
            spacing:    12px;
            children:   [ prompt, entry ];
        }

        prompt, entry, element-text, element-icon {
            vertical-align: 0.5;
        }

        prompt {
            text-color: @accent-color;
        }

        listview {
            lines:      8;
            columns:    1;

            fixed-height:   false;
        }

        element {
            padding:    8px;
            spacing:    8px;
        }

        element normal urgent {
            text-color: @base13;
        }

        element normal active {
            text-color: @accent-color;
        }

        element selected {
            text-color: @base0;
        }

        element selected normal {
            background-color:   @accent-color;
        }

        element selected urgent {
            background-color:   @base13;
        }

        element selected active {
            background-color:   @base8;
        }

        element-icon {
            size:   1.2em;
        }

        element-text {
            text-color: inherit;
        }
    '';

in {
    programs.rofi = {
        enable = true;
        font = "${font} ${size}";
        theme = theme;

        extraConfig = {
            show-icons = true;
            sort = true;

            display-drun = "󱄅  ";
            display-window = "󱄅  ";
        };
    };
}
