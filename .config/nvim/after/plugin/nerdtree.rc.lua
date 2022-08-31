local Remap = require("matthiasu.keymap")

local nnoremap = Remap.nnoremap

nnoremap('<leader>n', ':NERDTreeFocus<CR>')
nnoremap('<C-n>', ':NERDTree<CR>')
nnoremap('<C-t>', ':NERDTreeToggle<CR>')
nnoremap('<C-f>', ':NERDTreeFind<CR>')
