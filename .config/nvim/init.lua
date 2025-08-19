
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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
	    { "catppuccin/nvim", name = "catppuccin" },
	    { "rose-pine/neovim", name = "rose-pine" },

	    -- LSP configuration
	    { "neovim/nvim-lspconfig" },

	    -- Fuzzy Finder
	    { "junegunn/fzf" },
	    { "junegunn/fzf.vim" }, -- Vim interface for fzf

	    -- Linting
	    { "mfussenegger/nvim-lint" },

	    -- Autocompletion framework
	    { "hrsh7th/nvim-cmp" },
	    { "hrsh7th/cmp-nvim-lsp" },
	    { "hrsh7th/cmp-vsnip" },
	    { "hrsh7th/vim-vsnip" },

        { "preservim/nerdtree" },

        -- Comment
        { "numToStr/Comment.nvim"}, 

        -- Git 
        { "tpope/vim-fugitive"}, 

    },
    checker = { enabled = true },
})


vim.o.syntax = 'on'
vim.o.compatible = false
vim.o.signcolumn='yes'
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
vim.o.splitright = true
vim.o.wildmenu = true
vim.o.hlsearch = true
vim.g.mapleader = ' '
vim.g.netrw_liststyle = 3

vim.keymap.set('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', ':source<CR>', { noremap = true, silent = true })

-- UI 

require('catppuccin').setup({
    flavour = 'macchiato',
    background = { dark },
    transparent_background = true,
})

require('rose-pine').setup({
    variant = "moon", -- auto, main, moon, or dawn
    extend_background_behind_borders = true,
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
})


vim.cmd.colorscheme('rose-pine')
vim.o.winborder = 'rounded'

-- Fuzzy finder

vim.keymap.set('n', '<C-p>', ':GFiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ff', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })

-- LSP

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Terminal
vim.keymap.set('t', '<Esc>', ':<C-\\><C-n>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>t', ':tabnew term://zsh<CR>', { noremap = true, silent = true })

lspconfig.clangd.setup({
  capabilities = capabilities,
})

lspconfig.pyright.setup({
  capabilities = capabilities,
})


lspconfig.cmake.setup({
  capabilities = capabilities,
})

local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    })
})

vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { noremap = true, silent = true })



-- Linter

local lint = require('lint')
lint.linters_by_ft = {
    python = { 'ruff' }
}

-- NERD Tree

vim.cmd([[ let g:NERDTreeWinPos = "right" ]])
vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t', ':NERDTreeFind<CR>', { noremap = true, silent = true })


