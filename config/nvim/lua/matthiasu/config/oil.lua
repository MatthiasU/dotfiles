require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
    delete_to_trash = true,
    keymaps = {
        ["<space>p"] = { "actions.preview", mode = "n" },
        ["<C-p>"] = false,
    },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
    desc = "Open parent directory",
    noremap = true,
    silent = true
})
