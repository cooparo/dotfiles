{ ... }:
{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;

      settings = {
        trouble = false;
        current_line_blame = false;
      };
    };

    keymaps = [
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
      {
        # Reset hunk 
        action = "<cmd>Gitsign reset_hunk<CR>";
        key = "<leader>hr";
        mode = [ "n" ];
      }
    ];
  };
}
