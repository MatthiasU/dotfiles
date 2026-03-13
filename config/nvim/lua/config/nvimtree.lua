require('nvim-tree').setup({
    view = {
        side = 'right'
    },
    sync_root_with_cwd = true,
})

vim.keymap.set('n', '<leader>e', function()
    require("nvim-tree.api").tree.toggle({
        find_file = true,
        focus = true,
    })
end, { desc = "Toggle NvimTree" })
