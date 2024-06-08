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
            -- Remember where your invoking your program
            local arg_str = vim.fn.input('Program arguments: ')
            return vim.fn.split(arg_str, ' ', true)
        end,
        runInTerminal = false
    }
}

-- Enable debugging for c language
dap.configurations.c = dap.configurations.cpp

-- Mappings for basic dap
-- Using non-mnemonic mappings k
-- LuaFormatter off
vim.keymap.set('n', '<leader>kc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>ki', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>ko', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>kO', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>kb', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>kB', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<leader>kd', function() require('dap').clear_breakpoints() end)
vim.keymap.set('n', '<leader>kr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>kl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<leader>kh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({'n', 'v'}, '<leader>kp', function() require('dap.ui.widgets').preview() end)
vim.keymap.set('n', '<leader>ke', function() require('dap').close() end)
-- LuaFormatter on

vim.keymap.set('n', '<leader>kf', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>ks', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

