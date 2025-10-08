local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}

local exe_path = vim.fn.getcwd() .. '/'
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', exe_path, 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = function()
            -- Remember where your invoking your program because we need
            -- the correct path for arguments which are file paths
            local arg_str = vim.fn.input('Program arguments: ')
            return vim.fn.split(arg_str, ' ', true)
        end,
        runInTerminal = false
    }
}

-- Enable debugging for C language
dap.configurations.c = dap.configurations.cpp

-- Mappings for basic dap
-- Mix of custom and default mappings
-- Still need to figure out best set of maps
-- See :map and :nmap to list mappings for uniqueness
-- LuaFormatter off
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>cl', function() require('dap').clear_breakpoints() end)
vim.keymap.set('n', '<leader>do', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>rl', function() require('dap').run_last() end)
vim.keymap.set('n', '<leader>dc', function() require('dap').close() end)
vim.keymap.set({'n', 'v'}, '<leader>dh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({'n', 'v'}, '<leader>du', function() require('dap.ui.widgets').preview() end)
-- LuaFormatter on

vim.keymap.set('n', '<leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

