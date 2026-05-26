require("fzf-lua").setup()

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

vim.g.fzf_layout = { window = { width = 0.8, height = 0.5, xoffset = 0.5 } }

vim.keymap.set('n', '<leader>ff', ':FzfLua global<CR>', { desc = 'find git files' })
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', { desc = 'buffers' })
vim.keymap.set('n', '<leader>fl', ':FzfLua blines<CR>', { desc = 'search in file' })

vim.keymap.set('n', '<leader>sh', ':FzfLua helptags<CR>', { desc = 'search in file' })
