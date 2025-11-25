local telescope = require('telescope')

telescope.load_extension('fzf')
telescope.setup {
    pickers = {
        git_files = {
            hidden = true
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'help tags' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, { desc = 'symbols' })
