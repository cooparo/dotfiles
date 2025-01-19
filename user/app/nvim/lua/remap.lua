local map = vim.keymap

map.set("i", "jk", "<Esc>")
map.set("n", "<leader>w", "<cmd>w<CR>")
map.set("n", "<leader>q", "<cmd>wq<CR>")

map.set("n", "<leader>bd", "<cmd>bd<CR>") -- Delete buffer

-- Move visual block
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

-- Copy the deleted selection into the void register
map.set("x", "<leader>p", "\"_dP")
map.set("n", "<leader>d", "\"_d")
map.set("v", "<leader>d", "\"_d")

-- Copy to global clipboard
map.set("v", "<leader>y", "\"+y")
map.set("n", "<leader>y", "\"+y")

-- Lazygit
map.set("n", "<leader>gg", "<cmd>LazyGit<CR>")

--Bufferline
map.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
map.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
