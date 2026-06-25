vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':update<CR>', opts)
vim.keymap.set('n', '<leader>o', ':source<CR>', opts)
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
