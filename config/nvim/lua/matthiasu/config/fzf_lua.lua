local fzf_lua = require("fzf-lua")
fzf_lua.setup({
    winopts = {
        split = "belowright 12new",
        preview = { hidden = true },
    },
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        }
    },
    fzf_opts = {
        ["--tiebreak"] = "begin,length",
        ["--history"] = vim.fn.stdpath("data") .. "/fzf_history",
        ["--layout"] = "default"
    },
    ui_select = { true }
})

vim.keymap.set('n', '<C-p>', function() fzf_lua.files() end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>;', function() fzf_lua.buffers() end, { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fl', function() fzf_lua.blines() end, { desc = 'Search in file' })
vim.keymap.set('n', '<leader>fm', function() fzf_lua.marks() end, { desc = 'Find marks' })

vim.keymap.set('n', '<leader>sl', function() fzf_lua.history() end, { desc = 'Search latest files' })
vim.keymap.set('n', '<leader>sh', function() fzf_lua.help_tags() end, { desc = 'Search Help Tags' })
vim.keymap.set('n', '<leader>fs', function() fzf_lua.live_grep() end, { desc = 'Search with live grep' })

vim.keymap.set('n', '<leader>fq', function() fzf_lua.quickfix() end, { desc = 'Search in QuickFixlist' })
vim.keymap.set('n', '<leader>gb', function() fzf_lua.git_branches() end, { desc = 'Git branches' })
vim.keymap.set("n", "z=", function() fzf_lua.spell_suggest() end, { desc = "Fzf-lua spell suggest" })
