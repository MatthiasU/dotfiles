vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })

local term = require("toggleterm")
term.setup(
    {
        highlights = {
            Normal = {
                link = 'Normal',
            },
        },
        winbar = {
            enabled = false,
        },
    })

vim.keymap.set('n', '<leader>tt', ":ToggleTerm<CR>", { noremap = true, silent = true })
