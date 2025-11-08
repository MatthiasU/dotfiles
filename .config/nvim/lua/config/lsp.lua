
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
vim.lsp.enable('cmake')

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
vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'gq', vim.lsp.formatexpr, { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { noremap = true, silent = true })

vim.keymap.set('i', 'cr', vim.lsp.formatexpr, { noremap = true, silent = true })
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes('<C-y>', true, true, true)
  else
    return vim.api.nvim_replace_termcodes('<CR>', true, true, true)
  end
end, { expr = true, noremap = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\s\+$//e]] })
