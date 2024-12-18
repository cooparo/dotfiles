{ pkgs, userSettings, ... }:
{
  home.packages = with pkgs; [
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
      cat = "bat";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "dircycle colored-man-pages"
      ];
    };

    # NOTE: noxide evaluation
    initExtra = ''
      eval "$(zoxide init zsh)"
    '';

    oh-my-posh = {
      enable = true;
      settings = builtins.fromJSON (
        builtins.unsafeDiscardStringContext (builtins.readFile ./oh-my-posh/my-robbyrussel.json)
      );
      useTheme = "robbyrussell"; # fallback value
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      silent = true;

      nix-direnv.enable = true;
    };
  };
}
