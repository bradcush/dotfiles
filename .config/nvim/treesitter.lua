-- Consistent syntax highlighting from tree-sitter
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- Running built-in syntax and treesiter at the same time for
        -- less buggy spell check and bolding of return statements
        -- Could slow down vim and create duplicate highlights
        additional_vim_regex_highlighting = true
    },
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
