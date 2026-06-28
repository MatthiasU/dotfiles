require("mason").setup()

local lsp_group = vim.api.nvim_create_augroup('lsp_attach_group', { clear = true })
local lsp_fmt_group = vim.api.nvim_create_augroup('lsp_format_group', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = lsp_group,
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        -- 1. Enable Native Completion
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

        -- 2. Format on Save
        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = lsp_fmt_group, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = lsp_fmt_group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = false })
                end,
            })
        end

        -- 3. Buffer-Local Keymaps
        local opts = { buffer = bufnr, silent = true }

        -- Utilizing fzf-lua for richer navigation
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
        -- vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { noremap = true, silent = true })

        vim.keymap.set('n', 'gd', ":FzfLua lsp_definitions<cr>", opts)
        vim.keymap.set('n', 'gr', ":FzfLua lsp_references<cr>", opts)
        vim.keymap.set('n', 'gca', ":FzfLua lsp_code_actions<cr>", opts)
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gq', vim.lsp.formatexpr, opts)
        vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, opts)
    end,
})

vim.api.nvim_create_user_command('LspQuickFix', function()
    vim.diagnostic.setqflist()
end, { desc = 'Send LSP errors & warnings to quickfix list' })

vim.api.nvim_create_user_command('LspQuickFixErrors', function()
    vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Send LSP errors to quickfix list' })

vim.api.nvim_create_user_command('LspQuickFixWarnings', function()
    vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
end, { desc = 'Send LSP warnings to quickfix list' })

vim.api.nvim_create_user_command('LspFormat', function()
    vim.lsp.buf.format()
end, { desc = 'Format open buffer' })

vim.keymap.set('i', '<C-space>', function()
    vim.lsp.completion.get()
end)

vim.opt.completeopt = 'menu,menuone,noinsert,popup,fuzzy,preview'

vim.keymap.set('i', '<CR>', function()
    return vim.fn.pumvisible() ~= 0 and '<C-y>' or '<CR>'
end, { expr = true })

vim.lsp.enable('lua_ls')
vim.lsp.enable('superhtml')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('clangd')
vim.lsp.enable('cmake')
vim.lsp.enable('ruff')
vim.lsp.enable('pyrefly')
