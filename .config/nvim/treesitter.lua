-- Consistent syntax highlighting from tree-sitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash',
        'c',
        'css',
        'dockerfile',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'python',
        'swift',
        'toml',
        'tsx',
        'typescript',
        'yaml'
    },
    highlight = {enable = true},
    indent = {enable = true}
}
