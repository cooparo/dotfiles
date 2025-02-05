local builtin = require('telescope.builtin')
local keymap = vim.keymap

keymap.set('n', '<leader><leader>', "<cmd>Telescope frecency workspace=CWD<CR>", { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fr', function() builtin.oldfiles({ cwd_only = true }) end,
	{ desc = 'Telescope oldfiles in cwd' })
keymap.set('n', '<leader>tt', "<cmd>TodoTelescope keywords=TODO,FIX<CR>", { desc = 'Telescope buffers' })

local actions = require('telescope.actions')
require('telescope').setup({
	defaults = {
		mappings = {
			i = {                    -- Insert mode mappings
				["<Esc>"] = actions.close, -- Close on Esc in insert mode
			},
			n = {                    -- Normal mode mappings
				["<Esc>"] = actions.close, -- Close on Esc in normal mode
			},
		},
		extensions = {
			-- Configure the fzf-native extension
			fzf = {
				fuzzy = true,               -- Enable fuzzy search
				override_generic_sorter = true, -- Override the generic sorter
				override_file_sorter = true, -- Override the file sorter
				case_mode = "smart_case",   -- "smart_case" | "ignore_case" | "respect_case"
			},

			["ui-select"] = {
				require("telescope.themes").get_dropdown {
					-- even more opts
				}

				-- pseudo code / specification for writing custom displays, like the one
				-- for "codeactions"
				-- specific_opts = {
				--   [kind] = {
				--     make_indexed = function(items) -> indexed_items, width,
				--     make_displayer = function(widths) -> displayer
				--     make_display = function(displayer) -> function(e)
				--     make_ordinal = function(e) -> string
				--   },
				--   -- for example to disable the custom builtin "codeactions" display
				--      do the following
				--   codeactions = false,
				-- }
			}
		}
	},
})
