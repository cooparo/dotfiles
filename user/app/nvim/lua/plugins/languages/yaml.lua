local format = require('lsp-format')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lsp-config').yamlls.setup {
	capabilities = capabilities,
	on_attach = format.on_attach
}
