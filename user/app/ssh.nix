{ ... }:
{

  # ssh-agent starts, but doesn't add key automatically
  # even when adding key, they are not availabe globally

  # Solved with a workaround, i3 at start ssh-add the keys

  # services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    extraConfig = ''
      SetEnv TERM=xterm-256color
    '';
  };
}
