require('kanagawa').setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,   -- do not set background color
    dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    theme = "wave",        -- Load "wave" theme
    background = {         -- map the value of 'background' option to a theme
        dark = "wave",     -- try "dragon" !
        light = "lotus"
    },
})

vim.cmd.colorscheme('kanagawa')
