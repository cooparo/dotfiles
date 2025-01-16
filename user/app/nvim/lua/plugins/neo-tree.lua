vim.keymap.set('n', '<leader>e', "<cmd>Neotree position=left reveal toggle<CR>", { desc = 'Toggle neo-tree' })
vim.keymap.set('n', '<leader>o', "<cmd>Neotree position=left focus<CR>", { desc = 'Focus neo-tree' })

require("neo-tree").setup({
	popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
	close_if_last_window = true,

	filesystem = {
		follow_current_file = { enabled = true }, -- Automatically expand the directory of the current file
		use_libuv_file_watcher = true,          -- Automatically refresh the tree when files change
	},
	window = {
		width = "30",
		auto_expand_width = true, -- Automatically resize the width of the Neo-tree window
	},
	default_component_configs = {
		indent = {
			padding = 2, -- Set padding to make expansions visually clearer
		},
	},
})
