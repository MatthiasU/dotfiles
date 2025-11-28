vim.o.syntax = 'on'
vim.o.compatible = false
vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.background = 'dark'
vim.o.splitbelow = true
vim.o.swapfile = false
vim.o.splitright = true
vim.o.wildmenu = true
vim.o.hlsearch = true
vim.g.mapleader = ' '
vim.g.netrw_liststyle = 3
vim.opt.termguicolors = true

-- Persistent Undo
local undo_dir = vim.fn.stdpath('state') .. '/undo'
if vim.fn.isdirectory(undo_dir) == 0 then
    vim.fn.mkdir(undo_dir, 'p')
end

-- Configure persistent undo
vim.opt.undodir = undo_dir
vim.opt.undofile = true

vim.o.clipboard = "unnamedplus"
