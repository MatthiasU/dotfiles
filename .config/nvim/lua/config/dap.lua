
local dap = require("dap")

local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
sign('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

dap.adapters.lldb = {
type = 'executable',
command = '/Library/Developer/CommandLineTools/usr/bin/lldb-dap',
name = "lldb"
}

vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.toggle() end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dn', function() require('dap').step_over() end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>di', function() require('dap').step_into() end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>do', function() require('dap').step_out() end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dt', function() require('dap').terminate() end, { noremap = true, silent = true })

dap.configurations.cpp = {
{
  name = "Launch Executable",
  type = "lldb",
  request = "launch",
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
  args = {},
},
}


