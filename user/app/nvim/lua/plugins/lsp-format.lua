local format = require('lsp-format')
local lsp = require('lspconfig')

format.setup {}


lsp.nixd.setup { on_attach = format.on_attach }
lsp.pyright.setup { on_attach = format.on_attach }
