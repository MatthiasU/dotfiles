vim.keymap.set('n', '<c-p>', ':GFiles<CR>', { desc = 'find git files' })
vim.keymap.set('n', '<leader>fg', ':Rg<CR>', { desc = 'live grep' })
vim.keymap.set('n', '<c-b>', ':Buffers<CR>', { desc = 'buffers' })
vim.keymap.set('n', '<c-s>', ':BLines<CR>', { desc = 'search in file' })


local function build_quickfix_list(lines)
    vim.fn.setqflist(
        vim.tbl_map(function(line)
            return { filename = line, lnum = 1 }
        end, vim.list_slice(lines, 1, #lines)),
        'r'
    )
    vim.cmd.copen()
    vim.cmd.cc()
end

vim.g.fzf_action = {
    ['ctrl-q'] = build_quickfix_list,
    ['ctrl-t'] = 'tab split',
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit',
}

vim.g.fzf_layout = { down = '40%' }
