vim.api.nvim_create_user_command('JsonFormat',
    function()
        vim.cmd(":%!jq .")
    end,
    {}
)
