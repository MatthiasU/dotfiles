
vim.api.nvim_create_user_command('SessionSave',
    function()
        vim.cmd(":mksession! $HOME/.config/nvim/session.vim")
    end,
    {}
)

vim.api.nvim_create_user_command('SessionLoad',
    function()
        vim.cmd(":source $HOME/.config/nvim/session.vim")
    end,
    {}
)

