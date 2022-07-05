local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    -- ~/.cache/nvim/lsp.log for debug logs
    -- vim.lsp.set_log_level('debug')

    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = {noremap = true, silent = true}
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    keymap('n', '<leader>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('n', '<leader>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)

    -- Set some key bindings conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
        keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        -- Auto-format document prior to saving should be synchronous to
        -- finish update before save. Timeout is arbitrarily set to 500
        -- milliseconds for now. All files specified instead of current
        -- buffer due to autocmd being removed after new buffer created.
        vim.api.nvim_exec([[
            augroup formatting
                autocmd!
                autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)
            augroup END
        ]], true)
    elseif client.server_capabilities.documentRangeFormattingProvider then
        keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
    nvim_lsp[lsp].setup {on_attach = on_attach}
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
local signs = {Error = 'E ', Warn = 'W ', Hint = 'H ', Info = 'I '}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

-- Ignore formatting for js and ts because it conflicts
-- with eslint and prettier which is preferred
nvim_lsp['tsserver'].setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client, bufnr)
    end
}

-- eslint and prettier custom lsp among others
-- TODO: Specify separate efm setup for formatting types
-- we want to disable when there is no local config
nvim_lsp['efm'].setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
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

-- Set the path to the sumneko installation
local sumneko_root_path = '/Users/bcushing/Documents/repos/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/lua-language-server'
nvim_lsp['sumneko_lua'].setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            diagnostics = {globals = {'vim'}},
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                }
            }
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
