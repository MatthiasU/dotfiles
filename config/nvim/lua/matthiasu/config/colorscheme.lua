require('kanagawa').setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,   -- do not set background color
    dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    theme = "dragon",      -- Load "wave" theme
    background = {         -- map the value of 'background' option to a theme
        dark = "dragon",   -- try "dragon" !
        light = "lotus"
    },
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    }
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function(ev)
        if ev.match == "kanagawa-lotus" then
            vim.o.background = 'light'
        end
        if ev.match == "kanagawa" or ev.match == "kanagawa-dragon" or ev.match == "kanagawa-wave" then
            vim.o.background = 'dark'
        end
    end,
})

require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = true,
    transparent_mode = false,
})

vim.cmd.colorscheme('kanagawa-dragon')
