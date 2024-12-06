{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      closeIfLastWindow = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableRefreshOnWrite = true;
      enableModifiedMarkers = true;
      gitStatusAsync = true;

      popupBorderStyle = "rounded";

      window.autoExpandWidth = true;
      window.width = 30;

      filesystem.filteredItems.hideHidden = false;
    };

    keymaps = [
      {
        # Open 
        action = "<cmd>Neotree position=left reveal toggle<CR>";
        key = "<leader>e";
        mode = [ "n" ];
        options = {
          silent = true;
          desc = "Explorer NeoTree";
        };
      }

      {
        # Focus
        action = "<cmd>Neotree focus<CR>";
        key = "<leader>o";
        mode = [ "n" ];
        options = {
          silent = true;
          desc = "Focus NeoTree";
        };
      }
    ];
  };
}
