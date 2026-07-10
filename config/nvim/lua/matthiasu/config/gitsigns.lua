require('gitsigns').setup({
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end
        local opts = { noremap = true, silent = true }
        map('n', '<leader>hs', gitsigns.stage_hunk, opts)
        map('n', '<leader>hS', gitsigns.stage_buffer, opts)
        map('n', '<leader>hr', gitsigns.reset_hunk, opts)
        map('n', '<leader>hp', gitsigns.preview_hunk, opts)
        map('n', '<leader>hd', gitsigns.diffthis, opts)

        map('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)

        map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)
    end
})
