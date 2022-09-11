vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	transparent_background = false,
})

vim.cmd [[colorscheme catppuccin]]

