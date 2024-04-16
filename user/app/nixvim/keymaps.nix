{ ... }:
{
  programs.nixvim.keymaps = [
    {
      action = "<Esc>";
      key = "jk";
      mode = [ "i" ];
    }
  ];
}