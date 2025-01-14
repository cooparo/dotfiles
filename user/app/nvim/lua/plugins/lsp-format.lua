require("lsp-format").setup {}
require("lspconfig").nixd.setup { on_attach = require("lsp-format").on_attach }
