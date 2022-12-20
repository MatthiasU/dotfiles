local builtin = require('telescope.builtin')

local Remap = require("matthiasu.keymap")
local nnoremap = Remap.nnoremap

nnoremap('<leader>pf', builtin.find_files)
nnoremap('<C-p>', builtin.git_files)

require('telescope').setup{
	defaults = {
		path_display={"smart"}
	}
}
