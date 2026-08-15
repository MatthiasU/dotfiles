local dap = require("dap")

local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })

dap.adapters.lldb = {
    type = 'executable',
    command = 'lldb-dap',
    name = "lldb"
}

dap.adapters.debugpy = {
    type = 'executable',
    command = vim.fn.exepath("python3"),
    args = { '-m', 'debugpy.adapter' },
}

vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dB',
    function()
        local condition = vim.fn.input("Breakpoint condition: ")
        require('dap').toggle_breakpoint(condition)
    end, { noremap = true, silent = true, desc = "Toggle conditional breakpoint" })
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

dap.configurations.c = dap.configurations.cpp

local initRustDebugSymbols = function()
    -- Find out where to look for the pretty printer Python module.
    local rustc_sysroot = vim.fn.trim(vim.fn.system 'rustc --print sysroot')
    assert(
        vim.v.shell_error == 0,
        'failed to get rust sysroot using `rustc --print sysroot`: '
        .. rustc_sysroot
    )
    local script_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py'
    local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
    return {
        ([[!command script import '%s']]):format(script_file),
        ([[command source '%s']]):format(commands_file),
    }
end

dap.configurations.rust = {
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
        initCommands = initRustDebugSymbols,
    },
}

dap.configurations.python = {
    {
        type = 'debugpy',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return vim.fn.exepath("python3")
        end,
    },
    {
        type = 'debugpy',
        request = 'launch',
        name = "Launch Executable",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pythonPath = function()
            return vim.fn.exepath("python3")
        end,
    },
}

require("dapui").setup()
local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set("n", "<leader>du", function() require("dapui").toggle({ reset = true }) end, { desc = "Toggle DAP UI" })
vim.keymap.set('n', '<leader>dh', function() require('dap.ui.widgets').hover() end, { desc = 'Debug Hover' })
vim.keymap.set('n', '<leader>de', function() require('dapui').eval() end, { desc = 'Debug Evaluate' })
