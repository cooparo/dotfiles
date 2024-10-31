{ ... }:
{
  programs.nixvim.plugins.lspkind = {
    enable = true;
    cmp.enable = true;

    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };

}
