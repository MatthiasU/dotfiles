vim.pack.add({
    -- LSP
    "https://github.com/neovim/nvim-lspconfig",
    -- File Management
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    -- Git
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/tpope/vim-fugitive",
    -- Color schemes & UI
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    -- DAP packages
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
}, { load = false })

vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')
vim.cmd.packadd('cfilter')

local function list_packages()
    local plugins = vim.pack.get()
    local names = {}
    for _, plugin in pairs(plugins) do
        table.insert(names, plugin.spec.name)
    end
    return names
end

vim.api.nvim_create_user_command("PackagesList", function()
    local names = list_packages()
    for _, name in ipairs(names) do
        print(name)
    end
end, {})

vim.api.nvim_create_user_command("PackagesDelete", function()
    local names = list_packages()
    if #names == 0 then
        vim.notify("No packages found to delete.", vim.log.levels.WARN)
        return
    end

    vim.ui.select(names, {
        prompt = "Select a package to DELETE:",
    }, function(choice)
        if choice then
            vim.pack.del({ choice })
            vim.notify("Deleted package: " .. choice, vim.log.levels.WARN)
        else
            vim.notify("Deletion cancelled.", vim.log.levels.WARN)
        end
    end)
end, {})
