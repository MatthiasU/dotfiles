vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/junegunn/fzf",
    "https://github.com/junegunn/fzf.vim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/nvim-tree/nvim-tree.lua",
}, { load = true })

vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')
