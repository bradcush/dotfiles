local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    -- ~/.cache/nvim/lsp.log for debug logs
    -- vim.lsp.set_log_level('debug')

    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- Disabling signature help as mapping conflicts with window navigation
    -- keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    keymap('n', '<leader>dl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
           opts)
    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('n', '<leader>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)

    -- Set some key bindings conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        -- Auto-format document prior to saving should be synchronous to
        -- finish update before save. Timeout is arbitrarily set to 500
        -- milliseconds for now. All files specified instead of current
        -- buffer due to autocmd being removed after new buffer created.
        vim.api.nvim_exec([[
            augroup formatting
                autocmd!
                autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 500)
            augroup END
        ]], true)
    elseif client.resolved_capabilities.document_range_formatting then
        keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end
end

-- Use a loop to conveniently setup defined servers and map
-- buffer local keybindings when the language server attaches
local servers = {
    'bashls',
    'cssls',
    'clangd',
    'html',
    'jsonls',
    'pyright',
    'vimls',
    'yamlls'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {on_attach = on_attach}
end

-- Ignore formatting for js and ts because it conflicts
-- with eslint and prettier which is preferred
nvim_lsp['tsserver'].setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
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
local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'

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
