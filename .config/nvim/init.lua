-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = {
        -- Colorscheme
        { "rose-pine/neovim",       name = "rose-pine" },

        -- LSP configuration
        { "neovim/nvim-lspconfig" },

        -- DAP
        { "mfussenegger/nvim-dap"},

        -- Fuzzy Finder
        { "junegunn/fzf" },
        { "junegunn/fzf.vim" }, -- Vim interface for fzf

        -- Linting
        { "mfussenegger/nvim-lint" },

        -- Git
        { "tpope/vim-fugitive" },

        -- FileExplorer
        { "nvim-tree/nvim-tree.lua" },


    },
    checker = { enabled = true },
})


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

-- UI
require('rose-pine').setup({
    variant = "main",      -- auto, main, moon, or dawn
    extend_background_behind_borders = false,
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },
})


vim.cmd.colorscheme('rose-pine')
vim.o.winborder = 'rounded'

-- LSP

vim.lsp.enable('clangd')
vim.lsp.enable('cmake')
vim.lsp.enable('pyright')
vim.lsp.enable('texlab')
vim.lsp.enable('lua_ls')

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" } }
        }
    }
})

-- set autocomplete behavior.
--   fuzzy = fuzzy search in results
--   menuone = show menu, even if there is only 1 item
--   popup = show extra info in popup
--   noselect = don't insert the text until an item is selected
vim.cmd('set completeopt=fuzzy,menuone,popup,noselect')

-- set up stuff when the LSP client attaches
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

vim.keymap.set('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', ':source<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'gq', vim.lsp.formatexpr, { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', ':GFiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', ':Buffers<CR>', { noremap = true, silent = true })

-- DAP

vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', { noremap = true, silent = true })
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/Library/Developer/CommandLineTools/usr/bin/lldb-dap', -- adjust as needed, must be absolute path
  name = 'lldb'
}

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


-- Linter

local lint = require('lint')
lint.linters_by_ft = {
    python = { 'ruff' }
}

-- File Explorer

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup {
    view = {
        side = "right"
    }
}


-- Trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})
