local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    require'completion'.on_attach(client)
    option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    elseif client.resolved_capabilities.document_range_formatting then
        keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    -- Auto-format document prior to saving
    -- Should be sync but currently doesn't work
    vim.api.nvim_exec([[
        augroup formatting
            autocmd!
            autocmd BufWritePre * lua vim.lsp.buf.formatting()
        augroup END
    ]], true)

    -- Set highlight autocommand based on server_capabilities
    -- if client.resolved_capabilities.document_highlight then
    --     vim.api.nvim_exec([[
    --         hi LspReferenceRead cterm=bold ctermbg=red guibg=Grey
    --         hi LspReferenceText cterm=bold ctermbg=red guibg=Grey
    --         hi LspReferenceWrite cterm=bold ctermbg=red guibg=Grey
    --         augroup lsp_document_highlight
    --             autocmd!
    --             autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --             autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --         augroup END
    --     ]], false)
    -- end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
    'bashls',
    'cssls',
    'clangd',
    'jsonls',
    'pyright',
    'tsserver',
    'vimls'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {on_attach = on_attach}
end

-- Save once after async formatting is done as temp fix
-- https://www.reddit.com/r/neovim/comments/jvisg5/lets_talk_formatting_again/
vim.lsp.handlers['textDocument/formatting'] =
    function(err, _, result, _, bufnr)
        if err ~= nil or result == nil then
            return
        end
        if not vim.api.nvim_buf_get_option(bufnr, 'modified') then
            local view = vim.fn.winsaveview()
            vim.lsp.util.apply_text_edits(result, bufnr)
            vim.fn.winrestview(view)
            if bufnr == vim.api.nvim_get_current_buf() then
                vim.api.nvim_command('noautocmd :update')
            end
        end
    end

-- eslint and prettier custom lsp
require'lspconfig'.efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    settings = {
        -- Require formatter configuration files to load
        rootMarkers = {
            '.git/',
            '.eslintrc',
            '.eslintrc.json',
            '.eslintrc.js',
            '.prettierrc',
            '.prettierrc.js',
            '.prettierrc.json',
            '.prettierrc.yml',
            '.prettierrc.yaml',
            '.prettier.config.js'
        }
    }
}

-- Set the path to the sumneko installation
local sumneko_root_path = '/Users/bcushing/Documents/repos/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
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
