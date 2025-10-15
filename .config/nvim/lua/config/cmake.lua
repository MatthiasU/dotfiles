
vim.api.nvim_create_user_command('CMakeBuild',
    function()
        vim.cmd.vnew()
        vim.cmd.term("cmake --build ./build --config Debug")
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 5)
    end,
    {}
)

vim.api.nvim_create_user_command('CMakeTest',
    function()
        vim.cmd.vnew()
        vim.cmd.term("cmake --build ./build --config Debug && ctest --test-dir ./build --output-on-failure")
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 20)
    end,
    {}
)


