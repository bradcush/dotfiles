-- Consistent syntax highlighting from tree-sitter
require'nvim-treesitter.configs'.setup {
    highlight = {enable = true},
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
    }
}
