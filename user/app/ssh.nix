{ ... }: 
{

  # TODO: ssh-agent starts, but doesn't add key automatically
  # TODO: even when adding key, they are not availabe globally
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

  };
}