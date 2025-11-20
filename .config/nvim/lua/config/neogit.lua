require("neogit").setup()

vim.keymap.set('n', '<leader>scm', ':Neogit<CR>', { noremap = true, silent = true })
