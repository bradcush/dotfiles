let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'spell', 'gitbranch' ],
    \             [ 'readonly', 'fileinfo', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent', 'error', 'warning', 'info', 'hint' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'fileinfo': 'DynamicFileInfo',
    \   'gitbranch': 'DynamicFugitiveHead'
    \ },
    \ 'component_expand': {
    \   'error': 'DiagnosticError',
    \   'warning': 'DiagnosticWarning',
    \   'info': 'DiagnosticInfo',
    \   'hint': 'DiagnosticHint',
    \ },
    \ 'component_type': {
    \   'error': 'error',
    \   'warning': 'warning',
    \   'info': 'warning',
    \   'hint': 'warning',
    \ }
\ }

" Update Lightline when diagnostics information changes
autocmd User LspDiagnosticsChanged call lightline#update()

function! DynamicFileInfo()
    if expand('%:t') ==# ''
      return '[No Name]'
    endif
    return winwidth(0) > 130 ? expand('%:f') :expand('%:t')
endfunction

function! DynamicFugitiveHead()
    return winwidth(0) > 130 ? FugitiveHead() : ''
endfunction

" Custom diagnostics information
function! DiagnosticError() abort
    let error = luaeval("vim.lsp.diagnostic.get_count(0, [[Error]])")
    if empty(error) | return '' | endif
    let diagnostic = 'E' . error
    return diagnostic
endfunction

function! DiagnosticWarning() abort
    let warning = luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]])")
    if empty(warning) | return '' | endif
    let diagnostic = 'W' . warning
    return diagnostic
endfunction

function! DiagnosticInfo() abort
    let info = luaeval("vim.lsp.diagnostic.get_count(0, [[Information]])")
    if empty(info) | return '' | endif
    let diagnostic = 'I' . info
    return diagnostic
endfunction

function! DiagnosticHint() abort
    let hint = luaeval("vim.lsp.diagnostic.get_count(0, [[Hint]])")
    if empty(hint) | return '' | endif
    let diagnostic = 'H' . hint
    return diagnostic
endfunction

