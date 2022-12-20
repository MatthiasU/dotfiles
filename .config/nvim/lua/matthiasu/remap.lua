local Remap = require("matthiasu.keymap")

local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- navigating between windows
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

-- Disable Arrow keys in Normal mode
nnoremap('<up>', '<nop>')
nnoremap('<down>', '<nop>')
nnoremap('<left>', '<nop>')
nnoremap('<right>', '<nop>')

inoremap('<up>', '<nop>')
inoremap('<down>', '<nop>')
inoremap('<left>', '<nop>')
inoremap('<right>', '<nop>')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
