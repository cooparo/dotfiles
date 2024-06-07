{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh
    git
    eza
    oh-my-zsh
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = {
        gs = "git status";
        ls = "exa -TlL 1 --color-scale --icons --sort=type --no-time";
        la = "exa -aTlL1 --color-scale --icons --sort=type --no-time";
        sudo = "doas";
	rm = "rm -i";
	nix-shell = "nix-shell --command zsh";
    };
    
    oh-my-zsh = { 
        enable = true;
        plugins = [ "git" "dircycle "];
      };  

    initExtra = "source ~/.p10k.zsh";
    plugins = [
      {
	name = "powerlevel10k";
	src = pkgs.zsh-powerlevel10k;
	file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; 
      }
    ];
  };

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
