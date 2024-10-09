{ pkgs, userSettings, ... }:
let
  theme = if (userSettings.theme == "nord") then "Nord" else "gruvbox-dark";

in {
  home.packages = with pkgs; [
    zsh
    git
    eza
    oh-my-zsh
    oh-my-posh
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
	develop = "nix develop --command zsh";
	cd = "z";
	cdi = "zi";
	cat = "bat --theme=${theme}";
    };
    
    oh-my-zsh = { 
        enable = true;
        plugins = [ "git" "dircycle colored-man-pages"];
      };  

  initExtra = ''
     eval "$(zoxide init zsh)"
    '';
  };

  programs.oh-my-posh = {
    enable = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./oh-my-posh/my-robbyrussel.json));
    useTheme = "robbyrussell"; # fallback value
    enableZshIntegration = true;
  };

  programs.direnv = { 
    enable = true;
    enableZshIntegration = true;
    silent = true;

    nix-direnv.enable = true;
  };
}
