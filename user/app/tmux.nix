{ pkgs, userSettings, ... }:
let
  theme = if (userSettings.theme == "gruvbox-dark-medium") then "gruvbox" else userSettings.theme;
in
{
  home.packages = with pkgs; [
    gnused
    psmisc
    fzf
    bash
  ];

  programs.fzf.tmux.enableShellIntegration = true;

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    keyMode = "vi";

    shell = "${pkgs.zsh}/bin/zsh";
    baseIndex = 1;
    clock24 = true;
    escapeTime = 300;
    mouse = true;
    disableConfirmationPrompt = true;
    terminal = "screen-256color";
    secureSocket = false;
    extraConfig = ''
      set -as terminal-features ",alacritty*:RGB"

      # Open fzf for any type of commands with <prefix> + <C-f>
      TMUX_FZF_LAUNCH_KEY="C-f"

      # Binding 

      ## split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # reload config file (change file location to your the tmux.conf you want to use)
      bind r source-file ~/.config/tmux/tmux.conf

      # switch panes using Alt-arrow without prefix
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      # don't rename windows automatically
      set-option -g allow-rename off
    '';
    plugins = with pkgs; [
      tmuxPlugins.${theme}
      tmuxPlugins.tmux-fzf
    ];
  };
}
