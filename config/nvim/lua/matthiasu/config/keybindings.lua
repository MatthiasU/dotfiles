vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':update<CR>', opts)
vim.keymap.set('n', '<leader>o', ':source<CR>', opts)
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<C-n>', ':cnext<CR>', { desc = 'Next Quickfix item' })
vim.keymap.set('n', '<C-p>', ':cprev<CR>', { desc = 'Previous Quickfix item' })
vim.keymap.set('n', '<leader><leader>', '<C-^>', { desc = 'Toggle last buffer' })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })

-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })

