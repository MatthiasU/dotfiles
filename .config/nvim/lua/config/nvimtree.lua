
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("nvim-tree").setup({
    view = {
        side = "right"
    }
})
vim.keymap.set('n', '<leader>b', ':NvimTreeFindFileToggle<CR>', {  noremap = true, silent = true  })


