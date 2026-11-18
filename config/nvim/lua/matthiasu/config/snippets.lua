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

-- require("luasnip.loaders.from_vscode").load_standalone({
--     path = vim.fn.getcwd() .. "/.vscode/cpp.code-snippets",
-- })

vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    else
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
            "n",
            false
        )
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    else
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true),
            "n",
            false
        )
    end
end, { silent = true })

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
