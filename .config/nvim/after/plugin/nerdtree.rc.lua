local Remap = require("matthiasu.keymap")

local nnoremap = Remap.nnoremap

nnoremap('<leader>n', ':NERDTreeFocus<CR>')
nnoremap('<C-n>', ':NERDTreeToggle<CR>')
nnoremap('<C-f>', ':NERDTreeFind<CR>')
