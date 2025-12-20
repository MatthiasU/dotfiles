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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { "catppuccin/nvim",                 name = "catppuccin",                             priority = 1000 },
        { "neovim/nvim-lspconfig" },
        { "nvim-treesitter/nvim-treesitter", branch = 'master',                               lazy = false,   build = ":TSUpdate" },
        { 'nvim-lualine/lualine.nvim',       dependencies = { 'nvim-tree/nvim-web-devicons' } },
        { "mfussenegger/nvim-dap" },
        { "stevearc/oil.nvim" },
        { "lewis6991/gitsigns.nvim" },
        { "junegunn/fzf.vim",                dependencies = { "junegunn/fzf" } },
        { "tpope/vim-fugitive" },
        { "rose-pine/neovim" },
        { "neanias/everforest-nvim" },
    },
    checker = { enabled = true },
})
