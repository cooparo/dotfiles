vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>wq<CR>")

vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>")

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")

--Bufferline
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
