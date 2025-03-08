vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.clipboard = "unnamedplus"

vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.termguicolors = true

vim.o.smartindent = true
vim.o.wrap = false
vim.o.breakindent = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8

vim.o.updatetime = 200

vim.o.undofile = true
vim.o.cursorline = true

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = false
})
