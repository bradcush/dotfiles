let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'spell', 'gitbranch' ],
    \             [ 'readonly', 'fileinfo', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent', 'error', 'warning'],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
    \ },
    \ 'component_function': {
    \   'fileinfo': 'DynamicFileInfo',
    \   'filetype': 'DevIconsFileType',
    \   'gitbranch': 'DynamicFugitiveHead',
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
    \   'info': 'middle',
    \   'hint': 'middle',
    \ },
\ }

" Update Lightline when diagnostics info changes
autocmd User LspDiagnosticsChanged call lightline#update()

" Show file location information
function! DynamicFileInfo()
    if expand('%:t') ==# '' | return '[No Name]' | endif
    return winwidth(0) > 130 ? expand('%:f') : expand('%:t')
endfunction

" File type with dev icon
function! DevIconsFileType()
    return strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft'
endfunction
"
" Show branch information
function! DynamicFugitiveHead()
    if !strlen(FugitiveHead()) | return '' | endif
    return winwidth(0) > 130 ? "\ue725" . ' ' . FugitiveHead() : ''
endfunction

" Diagnostics error information
function! DiagnosticError() abort
    let error = luaeval('vim.lsp.diagnostic.get_count(0, [[Error]])')
    if empty(error) | return '' | endif
    let diagnostic = 'E' . error
    return diagnostic
endfunction

" Diagnostics warning information
function! DiagnosticWarning() abort
    let warning = luaeval('vim.lsp.diagnostic.get_count(0, [[Warning]])')
    if empty(warning) | return '' | endif
    let diagnostic = 'W' . warning
    return diagnostic
endfunction
