local fzf_lua = require("fzf-lua")
fzf_lua.setup({
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        }
    },
})

vim.g.fzf_layout = { window = { width = 0.8, height = 0.5, xoffset = 0.5 } }

vim.keymap.set('n', '<leader>ff', function() fzf_lua.global() end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fb', function() fzf_lua.buffers() end, { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fl', function() fzf_lua.blines() end, { desc = 'Search in file' })

vim.keymap.set('n', '<leader>sl', function() fzf_lua.history() end, { desc = 'Search latest files' })
vim.keymap.set('n', '<leader>sh', function() fzf_lua.help_tags() end, { desc = 'Search Help Tags' })
vim.keymap.set('n', '<leader>fs', function() fzf_lua.live_grep() end, { desc = 'Search with live grep' })
vim.keymap.set('n', '<leader>sr', function() fzf_lua.live_grep_resume() end, { desc = 'Resume live grep' })

vim.keymap.set('n', '<leader>fq', function() fzf_lua.quickfix() end, { desc = 'Search in QuickFixlist' })

vim.keymap.set('n', '<leader>gb', function() fzf_lua.git_branches() end, { desc = 'Git branches' })
