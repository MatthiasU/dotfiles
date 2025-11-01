
vim.api.nvim_create_user_command('CMakeBuild',
    function()
        vim.cmd.term("cmake --build ./build --config Debug")
    end,
    {}
)

vim.api.nvim_create_user_command('CMakeTest',
    function()
        vim.cmd.term("cmake --build ./build --config Debug && ctest --test-dir ./build --output-on-failure")
    end,
    {}
)

vim.keymap.set('n', '<leader>r', ':CMakeTest<CR>', { noremap = true, silent = true })
