require 'nvim-treesitter.configs'.setup {
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	indent = { enable = true, },
	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = {
		enable = true,

		keymaps = {
			init_selection = "<C-space>", -- set to `false` to disable one of the mappings
			node_incremental = "<C-space>",
			node_decremental = "<bs>",
			scope_incremental = false,
		},
	},
}
