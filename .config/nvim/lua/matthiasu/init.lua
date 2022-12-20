require('matthiasu.base')
require('matthiasu.keymap')
require('matthiasu.plugins')
require('matthiasu.remap')

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
