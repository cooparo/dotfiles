{ userSettings, ... }:
{
  programs.git = {
    enable = true;
    userName = "cooparo";
    userEmail = userSettings.email;
    extraConfig = {
      core.editor = userSettings.editor;
      pull.rebase = "false";
      init.defaultBranch = "main";
      rerere.enabled = true;
      push.autoSetupRemote = true;
      url = {
        "ssh://git@github.com/" = {
          insteadOf = "https://github.com/";
        };
      };

      maintenance = {
        enable = true;
        auto = true;
        strategy = "incremental";
        repositories = [
          userSettings.dotfilesDir
        ];
      };

      safe.directory = "*";
    };
  };
}
