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
    }
    {
      # Close file 
      action = "<cmd>wq<CR>";
      key = "<leader>q";
      mode = [ "n" ];
    }
    {
      # Next buffer
      action = "<cmd>bnext<CR>";
      key = "<leader>bn";
      mode = [ "n" ];
    }
    {
      # Previous buffer 
      action = "<cmd>bprevious<CR>";
      key = "<leader>bp";
      mode = [ "n" ];
    }
    {
      # Close buffer 
      action = "<cmd>bd<CR>";
      key = "<leader>bq";
      mode = [ "n" ];
    }

    ### - Telescope
    {
      # open find files
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
      mode = [ "n" ];
    }
    {
      # open live grep
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
      mode = [ "n" ];
    }
    {
      # open buffers
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fb";
      mode = [ "n" ];
    }

    ### - Neo-tree
    {
      # Open 
      action = "<cmd>Neotree position=left reveal toggle<CR>";
      key = "<leader>e";
      mode = [ "n" ];
    }
    {
      # Focus
      action = "<cmd>Neotree focus<CR>";
      key = "<leader>o";
      mode = [ "n" ];
    }
    ### - Gitsigns
    {
      # Toggle gitsigns
      action = "<cmd>Gitsign toggle_signs<CR>";
      key = "<leader>hh";
      mode = [ "n" ];
    }
    {
      # Stage hunk
      action = "<cmd>Gitsign stage_hunk<CR>";
      key = "<leader>hs";
      mode = [ "n" ];
    }
    {
      # Undo stage hunk 
      action = "<cmd>Gitsign undo_stage_hunk<CR>";
      key = "<leader>hu";
      mode = [ "n" ];
    }
    ### - Oil
    {
      action = "<cmd>Oil<CR>";
      key = "-";
      options = {
        desc = "Open parent directory";
        silent = true;
      };
      mode = [ "n" ];
    }
    ### - Lazygit
    {
      # Open Lazygit
      action = "<cmd>LazyGit<CR>";
      key = "<leader>gg";
      mode = [ "n" ];
    }
    ### - Shell command
    {
      # Run home-manager switch from nvim
      action = "<cmd>!home-manager switch --flake ~/dotfiles<CR>";
      key = "<leader>hm";
      mode = [ "n" ];
    }
    ### - toggleterm
    {
      action = "<cmd>ToggleTerm<CR>";
      key = "<leader>tt";
      mode = [ "n" ];
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
