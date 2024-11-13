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
