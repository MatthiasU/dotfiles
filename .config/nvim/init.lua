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

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {"rebelot/kanagawa.nvim"},
    {"neovim/nvim-lspconfig"},
    {'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = {'nvim-lua/plenary.nvim'}},
    {"tpope/vim-fugitive"},
    {"nvim-tree/nvim-tree.lua"},
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},
  },
  -- automatically check for plugin updates
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
vim.opt.termguicolors = true

require('kanagawa').setup({
    transparent = true,
})

require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
})



vim.cmd.colorscheme('catppuccin')

vim.keymap.set('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', ':source<CR>', { noremap = true, silent = true })

-- LSP

vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('ruff')

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

vim.keymap.set('n', '<leader>tt',
    function()
        vim.cmd.tabnew()
        vim.cmd.term()
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

-- File Explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('lualine').setup()

require("nvim-tree").setup({
    view = {
        side = "right"
    }
})
vim.keymap.set('n', '<leader>b', ':NvimTreeFindFileToggle<CR>', {  noremap = true, silent = true  })

-- Persistent Undo
local undo_dir = vim.fn.stdpath('state') .. '/undo'
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end

-- Configure persistent undo
vim.opt.undodir = undo_dir
vim.opt.undofile = true


-- CMake
vim.api.nvim_create_user_command('CMakeBuild',
    function()
        vim.cmd.vnew()
        vim.cmd.term("cmake --build ./build --config Debug")
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 5)
    end,
    {}
)

vim.api.nvim_create_user_command('CMakeTest',
    function()
        vim.cmd.vnew()
        vim.cmd.term("cmake --build ./build --config Debug && ctest --test-dir ./build --output-on-failure")
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 20)
    end,
    {}
)

-- Session Mgmt
vim.api.nvim_create_user_command('SessionSave',
    function()
        vim.cmd(":mksession! $HOME/.config/nvim/session.vim")
    end,
    {}
)

vim.api.nvim_create_user_command('SessionLoad',
    function()
        vim.cmd(":source $HOME/.config/nvim/session.vim")
    end,
    {}
)

