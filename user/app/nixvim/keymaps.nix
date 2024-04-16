{ ... }:
{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>g";
    }
    {
      action = "<Esc>";
      key = "jk";
      mode = [ "i" ];
    }
  ];
}