local format = require('lsp-format')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').pyright.setup {
	capabilities = capabilities,
	on_attach = format.on_attach
}

require('lspconfig').ruff.setup {
	capabilities = capabilities,
	on_attach = format.on_attach
}
