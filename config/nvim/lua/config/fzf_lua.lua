local fzf_lua = require("fzf-lua")
fzf_lua.setup()

vim.g.fzf_layout = { window = { width = 0.8, height = 0.5, xoffset = 0.5 } }

vim.keymap.set('n', '<leader>ff', function() fzf_lua.global() end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fb', function() fzf_lua.buffers() end, { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fl', function() fzf_lua.blines() end, { desc = 'Search in file' })

vim.keymap.set('n', '<leader>sh', function() fzf_lua.help_tags() end, { desc = 'Search Help Tags' })

vim.keymap.set('n', '<leader>fq', function() fzf_lua.quickfix() end, { desc = 'Search in QuickFixlist' })

vim.keymap.set('n', '<leader>gb', function() fzf_lua.git_branches() end, { desc = 'Git branches' })
