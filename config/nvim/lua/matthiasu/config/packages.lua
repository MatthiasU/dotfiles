local function gh(repo_name)
    return "https://github.com/" .. repo_name
end


vim.pack.add({
    -- LSP
    gh("neovim/nvim-lspconfig"),
    -- File Management
    gh("stevearc/oil.nvim"),
    gh("ibhagwan/fzf-lua"),
    -- Git
    gh("lewis6991/gitsigns.nvim"),
    gh("tpope/vim-fugitive"),
    -- Color schemes & UI
    gh("rebelot/kanagawa.nvim"),
    gh("folke/tokyonight.nvim"),
    gh("nvim-lualine/lualine.nvim"),
    -- DAP packages
    gh("nvim-neotest/nvim-nio"),
    gh("mfussenegger/nvim-dap"),
    gh("rcarriga/nvim-dap-ui"),
})

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
