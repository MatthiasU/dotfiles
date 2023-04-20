
local lsp_config = require('lspconfig')

local cmp = require('cmp')
local luasnip = require("luasnip")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
}

local snippet_engine = function(args)
    luasnip.lsp_expand(args.body)
end

local cmp_sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
})

local cmp_window_config = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
}

cmp.setup({
    snippet = { expand = snippet_engine },
    mapping = cmp_mappings,
    sources = cmp_sources,
    window = cmp_window_config,
})

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lua_settings = {
    Lua = {
        diagnostics = { globals = { 'vim' } }
    }
}

lsp_config.lua_ls.setup {
    on_attach = on_attach,
    settings = lua_settings,
    capabilities = capabilities
}

lsp_config.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lsp_config.cmake.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lsp_config.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require("luasnip.loaders.from_vscode").lazy_load()
