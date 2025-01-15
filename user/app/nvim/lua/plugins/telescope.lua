local builtin = require('telescope.builtin')
local keymap = vim.keymap

keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader><leader>', builtin.git_files, { desc = 'Telescope git files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- TODO: add TODO/FIX search 

local actions = require('telescope.actions')
require('telescope').setup({
	defaults = {
		mappings = {
			i = { -- Insert mode mappings
				["<Esc>"] = actions.close, -- Close on Esc in insert mode
			},
			n = { -- Normal mode mappings
				["<Esc>"] = actions.close, -- Close on Esc in normal mode
			},
		},
		extensions = {
			-- Configure the fzf-native extension
			fzf = {
				fuzzy = true,                    -- Enable fuzzy search
				override_generic_sorter = true,  -- Override the generic sorter
				override_file_sorter = true,     -- Override the file sorter
				case_mode = "smart_case",        -- "smart_case" | "ignore_case" | "respect_case"
			},
		}
	},
})
