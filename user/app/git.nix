{ userSettings, ... }:

{
    programs.git = {
      enable = true;
      userName = "cooparo";
      userEmail = userSettings.email;
      extraConfig = {
        core.editor = userSettings.term;
        pull.rebase = "false";
        init.defaultBranch = "main";
        rerere.enabled = true;
	push.autoSetupRemote = true;
      };
    };
}
