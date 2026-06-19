local default_session_file = ".session.vim"
local save_session_cmd = ":mksession! " .. default_session_file
local load_session_cmd = ":source " .. default_session_file

vim.api.nvim_create_user_command('SessionSave',
    function()
        vim.cmd(save_session_cmd)
    end,
    {}
)

vim.api.nvim_create_user_command('SessionLoad',
    function()
        vim.cmd(load_session_cmd)
    end,
    {}
)
