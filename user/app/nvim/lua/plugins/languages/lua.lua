local format = require('lsp-format')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lsp-confif').lua_ls.setup {
	capabilities = capabilities,
	on_attach = format.on_attach
}
