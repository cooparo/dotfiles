local map = vim.keymap

map.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map.set("n", "<leader>q", "<cmd>wq<CR>", { desc = "Save & quit file" })

map.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })

-- Move visual block
map.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block up" })
map.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block down" })

-- Center cursor
map.set("n", "<C-d>", "<C-d>zz", { desc = "Down half page" })
map.set("n", "<C-u>", "<C-u>zz", { desc = "Up half page" })
map.set("n", "n", "nzzzv", { desc = "Next occurence" })
map.set("n", "N", "Nzzzv", { desc = "Previous occurence" })

-- Copy the deleted selection into the void register
map.set("x", "<leader>p", "\"_dP", { desc = "Paste on selection" })
map.set("n", "<leader>d", "\"_d", { desc = "Delete to void register" })
map.set("v", "<leader>d", "\"_d", { desc = "Delete to void register" })

-- Copy to global clipboard
map.set("v", "<leader>y", "\"+y", { desc = "Yank to global clipboard" })
map.set("n", "<leader>y", "\"+y", { desc = "Yank to global clipboard" })

-- Splittings
map.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Split pane horizantally" })
map.set("n", "<leader>|", "<cmd>vs<CR>", { desc = "Split pane vertically" })
map.set("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
map.set("n", "<C-j>", "<C-w>j", { desc = "Move to down pane" })
map.set("n", "<C-k>", "<C-w>k", { desc = "Move to up pane" })
map.set("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- Lazygit
map.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- Code action
map.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Open code_action" })
