vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"
require('lualine').setup({
  sections = {
    lualine_x = { '%S', 'encoding', 'fileformat', 'filetype' }
  }
})
