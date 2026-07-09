require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
    delete_to_trash = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
    desc = "Open parent directory",
    noremap = true,
    silent = true
})
