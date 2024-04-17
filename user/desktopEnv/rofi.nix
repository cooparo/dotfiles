{ userSettings, config, ... }:

let

    font = builtins.elemAt userSettings.fonts 0; # First element of fonts list
    size = toString userSettings.fontSize;

in {
    programs.rofi = {
        enable = true;
        font = "${font} ${size}";
    };

    home.file.".config/rofi/theme.rasi" = with config.colorScheme.palette; {
        
        target = ".config/rofi/theme.rasi";
        text =  ''
            configuration {

            drun {
                display-name: "";
            }

            run {
                display-name: "";
            }

            window {
                display-name: "";
            }

            timeout {
                delay: 10;
                action: "kb-cancel";
            }
            }

            * {
            border: 0;
            margin: 0;
            padding: 0;
            spacing: 0;

            bg: #${base00};
            bg-alt: #${base01};
            fg: #${base0D};
            fg-alt: #${base0A};

            background-color: @bg;
            text-color: @fg;    
            }

            window {
            transparency: "real";
            }

            mainbox {
            children: [inputbar, listview];
            }

            inputbar {
            background-color: @bg-alt;
            children: [prompt, entry];
            }

            entry {
            background-color: inherit;
            padding: 12px 3px;
            }

            prompt {
            background-color: inherit;
            padding: 12px;
            }

            listview {
            lines: 8;
            }

            element {
            children: [element-icon, element-text];
            }

            element-icon {
            padding: 10px 10px;
            }

            element-text {
            padding: 10px 0;
            }

            element-text selected {
            text-color: @fg-alt;
            }

        '';
    };
}
