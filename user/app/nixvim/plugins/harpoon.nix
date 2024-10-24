{ ... }:
{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<C-e>";
      navNext = "<C-n>";
      navPrev = "<C-p>";
    };
  };
}
