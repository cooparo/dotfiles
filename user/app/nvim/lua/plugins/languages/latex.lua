local format = require('lsp-format')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Viewer options
vim.g.vimtex_view_method = 'zathura'

-- Generic interface for an alternative viewer
-- vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'

-- Set the compiler backend
vim.g.vimtex_compiler_method = 'latexrun'

require("lspconfig").texlab.setup {
	capabilities = capabilities,
	on_attach = format.on_attach
}
