vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>st',
    function()
        vim.cmd.vnew()
        vim.cmd.term()
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 5)
        vim.cmd("startinsert")
    end,
    { noremap = true, silent = true })

vim.keymap.set('n', '<leader>tt',
    function()
        vim.cmd.tabnew()
        vim.cmd.term()
        vim.cmd("startinsert")
    end,
    { noremap = true, silent = true })
