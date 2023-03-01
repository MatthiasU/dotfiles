local builtin = require('telescope.builtin')

local Remap = require("matthiasu.keymap")
local nnoremap = Remap.nnoremap

nnoremap('<leader>ff', builtin.find_files)
nnoremap('<leader>p', builtin.git_files)

require('telescope').setup{
	defaults = {
		path_display={"smart"},
        file_ignore_patterns = { "build", ".cache" }
	}
}
