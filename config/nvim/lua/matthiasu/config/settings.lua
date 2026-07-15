vim.o.syntax = 'on'
vim.o.compatible = false
vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = false
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
vim.o.hlsearch = true
vim.g.mapleader = ' '
vim.g.netrw_liststyle = 3
vim.opt.termguicolors = true
vim.opt.spell = false
vim.opt.autocomplete = false
vim.opt.pumborder = 'rounded'
vim.opt.pummaxwidth = 80

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.spell = false
vim.opt.spelllang = { 'en_us', 'de' }

vim.o.clipboard = "unnamedplus"

vim.api.nvim_create_user_command('ClearQuickFix', function()
    vim.fn.setqflist({}, 'r')
end, { desc = 'Clear the quickfix list' })

vim.filetype.add({ extension = { mm = 'objcpp' } })
