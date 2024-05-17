{ pkgs, userSettings,... }: 
let
  theme = if(userSettings.theme == "nord") then  "nord" else "gruvbox";
in
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    newSession = true;
    extraConfig = ''
      set -as terminal-features ",alacritty*:RGB"
    '';
    plugins = with pkgs; [
      tmuxPlugins.${theme}
    ];
  };
}
