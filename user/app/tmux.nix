{ pkgs, userSettings,... }: 
let
  theme = if(userSettings.theme == "nord") then  "nord" else "gruvbox";
in
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    newSession = true;
    terminal = "screen-256color";
    secureSocket = false;
    extraConfig = ''
      set -as terminal-features ",alacritty*:RGB"
    '';
    plugins = [
      pkgs.tmuxPlugins.${theme}
    ];
  };
}
