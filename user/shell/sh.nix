{ pkgs, ... }:
{
  #home.packages = [ pkgs.zsh ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
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

  home.packages = with pkgs; [
    eza
    oh-my-zsh
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}