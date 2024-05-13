{ ... }:

{ 
  programs.nixvim.keymaps = [
### - Vim 
  { # Exit insert mode
    action = "<Esc>";
    key = "jk";
    mode = [ "i" ];
  }

  { # Save file 
    action = "<cmd>w<CR>";
    key = "<leader>w";
  }
  { # Close file 
    action = "<cmd>q<CR>";
    key = "<leader>q";
  }
  { # Close without saving
    action = "<cmd>q!<CR>";
    key = "<leader>qq";
  }
  { # Next buffer 
      action = "<cmd>bnext<CR>";
    key = "<leader>bn";
  }
  { # Previous buffer 
    action = "<cmd>bprevious<CR>";
    key = "<leader>bp";
  }
  { # Close buffer 
    action = "<cmd>bdelete!<CR>";
    key = "<C-w>";
  }


### - Telescope
  { # open find files
    action = "<cmd>Telescope find_files<CR>";
    key = "<leader>ff";
  }
  { # open live grep
    action = "<cmd>Telescope live_grep<CR>";
    key = "<leader>fg";
  }
  { # open buffers
    action = "<cmd>Telescope buffers<CR>";
    key = "<leader>fb";
  }

### - Neo-tree
  { # Open 
    action = "<cmd>Neotree toggle<CR>";
    key = "<leader>e";
  }
  { # Focus
    action = "<cmd>Neotree focus<CR>";
    key = "<leader>o";
  }
### - Gitsigns
  { # Toggle gitsigns
    action = "<cmd>Gitsign toggle_signs<CR>";
    key = "<leader>hh";
  }
  { # Stage hunk
    action = "<cmd>Gitsign stage_hunk<CR>";
    key = "<leader>hs";
  }
  { # Undo stage hunk 
    action = "<cmd>Gitsign undo_stage_hunk<CR>";
    key = "<leader>hu";
  }
### - Oil
  {
    action = "<cmd>Oil<CR>";
    key = "-";
    options = {
      desc = "Open parent directory";
      silent = true;
    };
  }
### - Lazygit
  { # Open Lazygit
    action = "<cmd>LazyGit<CR>";
    key = "<leader>gg";
  }
### - Shell coomand
  { # Run home-manager switch from nvim
    action = "<cmd>!home-manager switch --flake ~/dotfiles<CR>";
    key = "<leader>hm";
  }
  ];
}
