local nvim_lsp = require('lspconfig')

-- Mappings for diagnostics
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- ~/.cache/nvim/lsp.log for debug logs
    -- vim.lsp.set_log_level('debug')

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings specific to buffers
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, bufopts)
    local async_format = function() vim.lsp.buf.format { async = true } end
    vim.keymap.set('n', '<leader>f', async_format, bufopts)

    -- Disable semantic token highlighting which is enabled
    -- automatically on attach for clients that support it
    client.server_capabilities.semanticTokensProvider = nil

    -- Set some key bindings conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
        -- Auto-format document prior to saving should be synchronous to
        -- finish update before save. Timeout left to be the default 1000
        -- milliseconds for now. All files specified instead of current
        -- buffer due to autocmd being removed after new buffer created.
        vim.api.nvim_exec([[
            augroup formatting
                autocmd!
                autocmd BufWritePre * lua vim.lsp.buf.format()
            augroup END
        ]], true)
    end
end

-- Use a loop to conveniently setup defined servers and map
-- buffer local keybindings when the language server attaches
local servers = {
    'bashls',
    'clangd',
    'cssls',
    'html',
    'jsonls',
    'pyright',
    'rust_analyzer',
    'vimls',
    'yamlls'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Overriding how diagnostics are published
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Instead of normal mode
        update_in_insert = true
    })

-- Change diagnostics icon and highlight group
-- Setting explicit defaults for icon at the moment
-- local signs = {Error = ' ', Warn = ' ', Hint = ' ', Info = ' '}
local signs = { Error = 'E ', Warn = 'W ', Hint = 'H ', Info = 'I ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Ignore formatting for js and ts because it conflicts
-- with eslint and prettier which is preferred
nvim_lsp['tsserver'].setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client, bufnr)
    end
}

-- Custom configuration for latex for
-- building, linting, and formatting
local aux_directory = './auxiliary';
local output_flag = '-outdir=' .. aux_directory;
nvim_lsp['texlab'].setup {
    on_attach = on_attach,
    settings = {
        texlab = {
            -- Current working directory instead
            -- of the current file location
            rootDirectory = '.',
            -- Built files in one directory
            auxDirectory = aux_directory,
            build = {
                args = {
                    '-pdf',
                    '-interaction=nonstopmode',
                    output_flag,
                    '-synctex=1',
                    '%f'
                },
                executable = 'latexmk',
                forwardSearchAfter = false,
                onSave = true
            },
            chktex = { onEdit = true, onOpenAndSave = true },
            latexindent = { modifyLineBreaks = true }
        }
    }
}

-- eslint and prettier custom lsp among others
-- TODO: Specify separate efm setup for formatting types
-- we want to disable when there is no local config
nvim_lsp['efm'].setup {
    on_attach = on_attach,
    init_options = { documentFormatting = true },
    -- Listing filetypes explicitly as to not conflict with
    -- other language servers that provide formatting
    filetypes = {
        'lua',
        'markdown',
        'python',
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'sh',
        'typescript',
        'typescriptreact',
        'typescript.tsx'
    }
}

-- Lua language server custom setup
nvim_lsp['lua_ls'].setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            -- Make the server aware of Neovim runtime files
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false }
        }
    }
}

-- Set paths for arduino language server command
local arduino_binary = '/Users/bcushing/go/bin/arduino-language-server'
local arduino_config = '/Users/bcushing/Library/Arduino15/arduino-cli.yaml'
nvim_lsp['arduino_language_server'].setup({
    on_attach = on_attach,
    -- Some flags like clangd and cli should be optional according to
    -- documentation but are required to run the language server. The Fully
    -- Qualified Board Name (FQBN) also needs to be set, which can be hardcoded
    -- here or referenced in a project specific sketch.json file.
    cmd = {
        arduino_binary,
        '-cli-config',
        arduino_config,
        '-clangd',
        'clangd',
        '-cli',
        'arduino-cli'
    }
})
