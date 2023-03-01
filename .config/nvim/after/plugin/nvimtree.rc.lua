
local Remap = require("matthiasu.keymap")
local nnoremap = Remap.nnoremap

nnoremap('<leader>n', ":NvimTreeToggle<cr>")

require("nvim-tree").setup({
    view = {
        side = "right"
    }
})
