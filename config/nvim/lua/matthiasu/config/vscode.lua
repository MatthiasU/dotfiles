require("matthiasu.config.packages")
require("matthiasu.config.keybindings")
require("matthiasu.config.settings")
require("matthiasu.config.cmake")
require("matthiasu.config.undo")
require("matthiasu.config.path")
require("matthiasu.config.snippets")
require("matthiasu.config.bazel")

local vscode = require("vscode")
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>e", function()
    require('vscode').call('workbench.view.explorer')
end, opts)

vim.keymap.set("n", "<leader>ff", function()
    require('vscode').call('workbench.action.quickOpen')
end, opts)

vim.keymap.set("n", "gn", function()
    require('vscode').call('editor.action.rename')
end, opts)

vim.keymap.set("n", "gr", function()
    require('vscode').call('references-view.findReferences')
end, opts)

vim.keymap.set("n", "gca", function()
    require('vscode').call('editor.action.quickFix')
end, opts)

vim.keymap.set("n", "fs", function()
    require('vscode').call('workbench.action.findInFiles')
end, opts)


vim.keymap.set("n", "<leader>b", function()
    require('vscode').call('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')
end, opts)

vim.keymap.set('n', 'za', function() vim.fn.VSCodeNotify('editor.toggleFold') end, opts)

-- Close/Fold current region
vim.keymap.set('n', 'zc', function() vim.fn.VSCodeNotify('editor.fold') end, opts)

-- Open/Unfold current region
vim.keymap.set('n', 'zo', function() vim.fn.VSCodeNotify('editor.unfold') end, opts)

-- Fold all regions
vim.keymap.set('n', 'zM', function() vim.fn.VSCodeNotify('editor.foldAll') end, opts)

-- Unfold all regions
vim.keymap.set('n', 'zR', function() vim.fn.VSCodeNotify('editor.unfoldAll') end, opts)
