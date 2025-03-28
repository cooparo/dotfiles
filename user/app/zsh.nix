{
  lib,
  pkgs,
  config,
  ...
}:
{
  options = {
    zsh.enable = lib.mkEnableOption "Enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [
      git
      eza
      oh-my-zsh
      oh-my-posh
      zsh-powerlevel10k
    ];

    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        shellAliases = {
          v = "nix run github:cooparo/nvim --";
          nvim = "nix run github:cooparo/nvim --";
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

        #NOTE: zoxide evaluation
        initExtra = ''
          eval "$(zoxide init zsh)"
        '';
      };

      oh-my-posh = with config.colorscheme.palette; {
        enable = true;
        settings = builtins.fromJSON ''
          	{
            "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
            "blocks": [
              {
                "alignment": "left",
                "segments": [
          	{
          	  "foreground": "#${base0B}",
          	  "style": "plain",
          	  "template": "\u279c",
          	  "type": "text"
          	},
          	{
          	  "foreground": "#${base0C}",
          	  "properties": {
          	    "style": "folder"
          	  },
          	  "style": "plain",
          	  "template": " {{ .Path }} ",
          	  "type": "path"
          	},
          	{
          	  "foreground": "#${base08}",
          	  "properties": {
          	    "branch_icon": "",
          	    "fetch_status": true
          	  },
          	  "style": "plain",
          	  "template": "<#${base0D}>git:(</>{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uF044 {{ .Working.String }}{{ end }}{{ if and (.Staging.Changed) (.Working.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uF046 {{ .Staging.String }}{{ end }}<#${base0D}>)</>",
          	  "type": "git"
          	},
          	{
          	  "foreground": "#${base08}",
          	  "style": "plain",
          	  "template": " \u2717",
          	  "type": "status"
          	}
                ],
                "type": "prompt"
              },
              {
                "alignment": "right",
                "segments": [
          	{
          	  "type": "python",
          	  "style": "plain",
          	  "foreground": "#ffe05d",
          	  "template": "{{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }} {{ .Full }}{{ end }}"
          	},
          	{
          	  "type": "session",
          	  "style": "plain",
          	  "template": "{{ if .SSHSession }}󰣀 {{ .HostName }}{{ end }}"
          	},
          	{
          	  "type": "project",
          	  "style": "plain",
          	  "foreground": "#${base06}",
          	  "template": " {{ if .Error }}{{ .Error }}{{ else }}{{ if .Version }} {{.Version}}{{ end }} {{ if .Name }}{{ .Name }}{{ end }}{{ end }} "
          	},
          	{
          	  "type": "nix-shell",
          	  "style": "plain",
          	  "foreground": "#5277c3",
          	  "background": "transparent",
          	  "template": "\uF313 (nix-{{ .Type }})"
          	}
                ],
                "type": "rprompt"
              }
            ],
            "final_space": true,
            "version": 2
          }
        '';
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
  };
}
