-- launch.json template
vim.api.nvim_create_user_command('TemplateLaunchJson', function()
    local snippet_text = [[
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "${1:Launch Current File}",
      "type": "${2:lldb}",
      "request": "launch",
      "program": "\${file}",
      "cwd": "\${workspaceFolder}",
      "console": "internalConsole"
    }
  ]
}]]
    vim.snippet.expand(snippet_text)
end, { desc = "Insert launch.json template via built-in snippet engine" })

local ls = require("luasnip")
ls.setup()

vim.keymap.set("i", "<C-k>", function()
    if ls.expandable() then
        ls.expand()
    end
end, { desc = "Expand snippet" })

vim.api.nvim_create_user_command("SnipList", function()
    local ft_list = require("luasnip").available()[vim.bo.filetype] or {}
    local snips = {}
    for _, item in pairs(ft_list) do
        snips[item.trigger] = item.name
    end
    print(vim.inspect(snips))
end, {})

local vscode_loader = require("luasnip.loaders.from_vscode")
local loaded_projects = {}

local function load_project_snippets(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    local root = vim.fs.root(bufnr, { ".git", ".vscode" })

    if not root or loaded_projects[root] then
        return
    end

    local snippet_dir = root .. "/.vscode"

    if vim.fn.isdirectory(snippet_dir) == 0 then
        return
    end

    local files = vim.fn.glob(
        snippet_dir .. "/*.code-snippets",
        false,
        true
    )

    for _, file in ipairs(files) do
        vscode_loader.load_standalone({
            path = file,
        })
    end

    loaded_projects[root] = true
end

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        load_project_snippets(args.buf)
    end,
})
