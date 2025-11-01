
require("config.lazy")
require("config.settings")
require("config.colorscheme")
require("config.lsp")
require("config.dap")
require("config.keybindings")
require("config.terminal")
require("config.telescope")
-- require("config.nvimtree")
require("config.cmake")
require("config.session")

require('lualine').setup()

-- Trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})



