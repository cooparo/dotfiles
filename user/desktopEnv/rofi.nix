{ userSettings, config, ... }:

let

  font = "Firacode";
  size = toString userSettings.fontSize;
  color = config.colorScheme.palette;

  # taken from https://github.com/lr-tech/rofi-themes-collection
  theme =
    with color;
    builtins.toFile "rofi-theme.rasi" ''
      * {

          base0:     #${base00};
          base1:     #${base01};
          base2:     #${base02};
          base3:     #${base03};

          base4:     #${base04};
          base5:     #${base05};
          base6:     #${base06};

          base7:     #${base07};
          base8:     #${base0C};
          base9:     #${base0D};
          base10:    #${base0F};
          base11:    #${base08};

          base12:    #${base09};
          base13:    #${base0A};
          base14:    #${base0B};
          base15:    #${base0E};

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

in
{
  programs.rofi = {
    enable = true;
    font = "${font} ${size}";
    inherit theme;

    extraConfig = {
      show-icons = true;
      sort = true;

      display-drun = "󱄅  ";
      display-window = "󱄅  ";
    };
  };
}
