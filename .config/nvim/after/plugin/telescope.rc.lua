local Remap = require("matthiasu.keymap")

local nnoremap = Remap.nnoremap

nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>fg', '<cmd>Telescope git_files<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>fs', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fw', '<cmd>Telescope grep_string<cr>')
