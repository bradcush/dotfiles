local cmp = require('cmp')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end
    },
    window = {
        -- Polished design for completion menus
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered()
    },
    -- Menu navigation mappings
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Require explicit selection of item
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {'i', 's'})
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'vsnip'} -- For vsnip users
    }, {{name = 'buffer'}, {name = 'path'}, {name = 'calc'}})
})

-- Use buffer source for `/` and `?` (if you enabled
-- `native_menu`, this won't work anymore).
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})

-- Use cmdline & path source for ':' (if you enabled
-- `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}}),
    matching = {disallow_symbol_nonprefix_matching = false}
})

-- Mappings for diagnostics
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, opts)
local workspace_diagnostics = '<cmd>TroubleToggle workspace_diagnostics<cr>'
vim.keymap.set('n', '<leader>dw', workspace_diagnostics, opts)

local on_attach = function(client, bufnr)
    -- ~/.cache/nvim/lsp.log for debug logs
    -- vim.lsp.set_log_level('debug')

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings specific to buffers
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, bufopts)
    -- No need to block anything when formatting manually
    local async_format = function() vim.lsp.buf.format {async = true} end
    vim.keymap.set('n', '<leader>fm', async_format, bufopts)

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

-- Disable formatting (eg. gqq) by language server
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args) vim.bo[args.buf].formatexpr = nil end
})

-- Hide all semantic highlights by disabling groups
for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
    vim.api.nvim_set_hl(0, group, {})
end

local nvim_lsp = require('lspconfig')
-- Capabilities for language server setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Use a loop to conveniently setup defined servers and map
-- buffer local keybindings when the language server attaches
local servers = {
    'bashls',
    'clangd',
    'cssls',
    'gopls',
    'html',
    'jdtls',
    'jsonls',
    'julials',
    'pyright',
    'rust_analyzer',
    'vimls',
    'yamlls'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {on_attach = on_attach, capabilities = capabilities}
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

-- Disable default formatting to allow something custom
local on_attach_without_formatting = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client, bufnr)
end

-- Ignore formatting for js and ts because it conflicts
-- with eslint and prettier which is preferred
nvim_lsp['tsserver'].setup {on_attach = on_attach_without_formatting}

-- Lua language server custom setup
nvim_lsp['lua_ls'].setup {
    on_attach = on_attach_without_formatting,
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT'},
            diagnostics = {
                globals = {'awesome', 'client', 'root', 'screen', 'vim'}
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false
            },
            telemetry = {enable = false}
        }
    }
}

-- Custom configuration for latex for linting and formatting
-- Supports building but using "vim-latex-live-preview" preferred
nvim_lsp['texlab'].setup {
    on_attach = on_attach,
    settings = {
        texlab = {
            chktex = {onEdit = true, onOpenAndSave = true},
            latexFormatter = 'latexindent',
            latexindent = {modifyLineBreaks = true}
        }
    }
}

-- Custom language server setup
nvim_lsp['efm'].setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    -- Listing filetypes explicitly as to not conflict with
    -- other language servers that provide formatting
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'json',
        'lua',
        'markdown',
        'python',
        'sh',
        'typescript',
        'typescriptreact',
        'typescript.tsx'
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

-- Setup HLS for related filetypes
nvim_lsp['hls'].setup({
    on_attach = on_attach,
    filetypes = {'haskell', 'lhaskell', 'cabal'}
})

-- Trouble pretty lists setup
require('trouble').setup {
    icons = false,
    padding = false,
    signs = {
        -- Not specified by default
        other = 'O'
    },
    use_diagnostic_signs = true
}
