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
