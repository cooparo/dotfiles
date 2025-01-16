local color = require("base16-colorscheme").colors

require("barbecue").setup({
	create_autocmd = false, -- prevent barbecue from updating itself automatically

	theme = {
		-- this highlight is used to override other highlights
		-- you can take advantage of its `bg` and set a background throughout your winbar
		-- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
		normal = { fg = color.base0D },

		-- these highlights correspond to symbols table from config
		ellipsis = { fg = color.base06 },
		separator = { fg = color.base06 },
		modified = { fg = color.base06 },

		-- these highlights represent the _text_ of three main parts of barbecue
		dirname = { fg = color.base06 },
		basename = { bold = true },
		context = {},

		-- these highlights are used for context/navic icons
		context_file = { fg = color.base06 },
		context_module = { fg = color.base06 },
		context_namespace = { fg = color.base06 },
		context_package = { fg = color.base06 },
		context_class = { fg = color.base06 },
		context_method = { fg = color.base06 },
		context_property = { fg = color.base06 },
		context_field = { fg = color.base06 },
		context_constructor = { fg = color.base06 },
		context_enum = { fg = color.base06 },
		context_interface = { fg = color.base06 },
		context_function = { fg = color.base06 },
		context_variable = { fg = color.base06 },
		context_constant = { fg = color.base06 },
		context_string = { fg = color.base06 },
		context_number = { fg = color.base06 },
		context_boolean = { fg = color.base06 },
		context_array = { fg = color.base06 },
		context_object = { fg = color.base06 },
		context_key = { fg = color.base06 },
		context_null = { fg = color.base06 },
		context_enum_member = { fg = color.base06 },
		context_struct = { fg = color.base06 },
		context_event = { fg = color.base06 },
		context_operator = { fg = color.base06 },
		context_type_parameter = { fg = color.base06 },
	},
})

vim.api.nvim_create_autocmd({
	"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",

	-- include this if you have set `show_modified` to `true`
	"BufModifiedSet",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})
