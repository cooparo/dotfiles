{ ... }:
{
  services.batsignal = {
    enable = true;
    extraArgs = [
      "-e"
      "-w"
      "30"
      "-c"
      "15"
      "-d"
      "10"
      "-f"
      "99"
    ];
  };
}
