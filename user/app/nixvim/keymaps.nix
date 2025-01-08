{ ... }:
{
  programs.nixvim.keymaps = [
    ### - Vim
    {
      action = "<Esc>";
      key = "jk";
      mode = [ "i" ];
    }
    {
      action = "<cmd>w<CR>";
      key = "<leader>w";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Save file";
    }
    {
      action = "<cmd>wq<CR>";
      key = "<leader>q";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Close nvim";
    }
    {
      action = "0";
      key = "H";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Start of the line";
    }
    {
      action = "$";
      key = "L";
      mode = [
        "n"
        "v"
      ];
      options.desc = "End of the line";
    }
    {
      action = "<C-d>zz";
      key = "<C-d>";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Move the screen down by half paga and re-center cursor";
    }
    {
      action = "<C-u>zz";
      key = "<C-u>";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Move the screen up by half paga and re-center cursor";
    }
    ### - Shell command
    {
      # Run home-manager switch from nvim
      action = "<cmd>!home-manager switch --flake ~/dotfiles<CR>";
      key = "<leader>hm";
      mode = [ "n" ];
    }
    ### - todo-comments
    {
      # Open todos
      action = "<cmd>TodoTelescope keywords=TODO,FIX<CR>";
      key = "<leader>tt";
      mode = [
        "n"
        "v"
      ];
      options.desc = "Opens todos/fixes";
    }
  ];
}
