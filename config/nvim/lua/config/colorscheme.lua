require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = {    -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    no_italic = false,             -- Force no italic
    no_bold = false,               -- Force no bold
    no_underline = false,          -- Force no underline
})

vim.cmd.colorscheme('catppuccin')
