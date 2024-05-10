{ ... }:

{ 
  programs.nixvim.keymaps = [
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
  {
    action = "<cmd>Oil<CR>";
    key = "-";
    options = {
      desc = "Open parent directory";
      silent = true;
    };
  }
  { # Open Lazygit
    action = "<cmd>LazyGit<CR>";
    key = "<leader>gg";
  }
  ];
}
