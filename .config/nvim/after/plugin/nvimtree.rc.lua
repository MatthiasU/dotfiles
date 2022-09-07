require("nvim-tree").setup()

local Remap = require("matthiasu.keymap")

local nnoremap = Remap.nnoremap

nnoremap('<leader>n', ':NvimTreeFocus<CR>')
nnoremap('<C-n>', ':NvimTreeToggle<CR>')
nnoremap('<C-f>', ':NvimTreeFindFile<CR>')
