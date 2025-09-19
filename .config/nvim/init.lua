vim.o.syntax = 'on'
vim.o.compatible = false
vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.background = 'dark'
vim.o.splitbelow = true
vim.o.swapfile = false
vim.o.splitright = true
vim.o.wildmenu = true
vim.o.hlsearch = false
vim.g.mapleader = ' '
vim.g.netrw_liststyle = 3

vim.cmd.colorscheme('kanagawa')

vim.keymap.set('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', ':source<CR>', { noremap = true, silent = true })

-- LSP

vim.lsp.enable('clangd')

vim.cmd('set completeopt=fuzzy,menuone,popup,noselect')

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end,
})

vim.keymap.set('i', '<C-space>', function()
    vim.lsp.completion.get()
end)

-- Auto formatting
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- Only create the format autocmd if the client supports formatting
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, async = false })
                end,
            })
        end
    end,
})

vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format)
vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'gq', vim.lsp.formatexpr, { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { noremap = true, silent = true })

-- Terminal
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

-- Trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

-- Telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


