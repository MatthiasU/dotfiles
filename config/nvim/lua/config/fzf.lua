vim.keymap.set('n', '<leader>ff', ':Files<CR>', { desc = 'find files' })
vim.keymap.set('n', '<leader>fg', ':Rg<CR>', { desc = 'live grep' })
vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { desc = 'buffers' })
vim.keymap.set('n', '<leader>fh', ':HelpTags<CR>', { desc = 'help tags' })

vim.g.fzf_action = {
    ['ctrl-q'] = vim.fn['s:build_quickfix_list'],
    ['ctrl-t'] = 'tab split',
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit',
}
