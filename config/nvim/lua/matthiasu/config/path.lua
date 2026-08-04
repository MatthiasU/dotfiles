function CopyFilePath(opts)
    local file_path = vim.fn.expand('%:p')

    -- Default to unnamed register (+) if no argument is provided
    local register = (opts.args ~= "") and opts.args or '+'

    if file_path ~= "" then
        vim.fn.setreg(register, file_path)
        vim.notify("Path copied to register [" .. register .. "]: " .. file_path, vim.log.levels.INFO)
    end
end

vim.api.nvim_create_user_command(
    'CopyPath',
    CopyFilePath,
    { nargs = '?', desc = 'Copy path to specified register (defaults to +)' }
)

function CopyRelativeFilePath(opts)
    -- default to unnamed register (+) if no argument is provided
    local register = (opts.args ~= "") and opts.args or '+'
    local file_path_rel = vim.fn.expand('%:.')
    if file_path_rel ~= "" then
        vim.fn.setreg(register, file_path_rel)
        vim.notify("Relative path copied to register [" .. register .. "]: " .. file_path_rel, vim.log.levels.INFO)
    else
        vim.notify("Could not determine relative path", vim.log.levels.WARN)
    end
end

-- Create the user command :CopyRelPath
vim.api.nvim_create_user_command(
    'CopyRelPath',
    CopyRelativeFilePath,
    {
        nargs = '?',
        desc = 'Copy relative path to specified register (defaults to +)'
    }
)

function CopyFileName(opts)
    local register = (opts.args ~= "") and opts.args or '+'
    local file_name = vim.fn.expand('%:t')
    if file_name ~= "" then
        vim.fn.setreg(register, file_name)
        vim.notify("file name copied to register [" .. register .. "]: " .. file_name, vim.log.levels.INFO)
    else
        vim.notify("could not determine file name", vim.log.levels.WARN)
    end
end

vim.api.nvim_create_user_command(
    'CopyFileName',
    CopyFileName,
    {
        nargs = '?',
        desc = 'copy relative path to specified register (defaults to +)'
    }
)

vim.keymap.set('n', '<leader>cp', ':CopyPath<CR>', { desc = 'copy absolute path' })
vim.keymap.set('n', '<leader>cP', ':CopyRelPath<CR>', { desc = 'copy relative path' })
vim.keymap.set('n', '<leader>cf', ":CopyFileName<CR>", { desc = 'copy file name' })
