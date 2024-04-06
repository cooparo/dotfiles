{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh
    git
    eza
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = {
        gs = "git status";
        satoshi = "ssh paro@192.168.0.158";
        ls = "exa -TlL 1 --color-scale --icons --sort=type --no-time";
        la = "exa -aTlL1 --color-scale --icons --sort=type --no-time";
    };
    
    oh-my-zsh = { 
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };  
  };

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}