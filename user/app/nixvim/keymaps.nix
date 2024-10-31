{ ... }:
{
  programs.nixvim.keymaps = [
    ### - Vim 
    {
      # Exit insert mode
      action = "<Esc>";
      key = "jk";
      mode = [ "i" ];
    }
    {
      # Save file 
      action = "<cmd>w<CR>";
      key = "<leader>w";
      mode = [ "n" ];
      options.desc = "Save file";
    }
    {
      # Close file 
      action = "<cmd>wq<CR>";
      key = "<leader>q";
      mode = [ "n" ];
      options.desc = "Close nvim";
    }

    ### - Shell command
    {
      # Run home-manager switch from nvim
      action = "<cmd>!home-manager switch --flake ~/dotfiles<CR>";
      key = "<leader>hm";
      mode = [ "n" ];
    }
  ];
}
