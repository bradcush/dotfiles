let g:lightline = {}
let g:lightline.colorscheme = 'one'

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'spell', 'gitbranch' ],
    \           [ 'readonly', 'fileinfo', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent', 'error', 'warning'],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }

" Currently just defaults listed
let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.tabline = {
    \ 'left': [ [ 'vim_logo' ], [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }

let g:lightline.component = {
    \ 'vim_logo': "\ue7c5" }

let g:lightline.component_function = {
    \ 'fileinfo': 'DynamicFileInfo',
    \ 'filetype': 'DevIconsFileType',
    \ 'gitbranch': 'DynamicFugitiveHead' }

let g:lightline.component_expand = {
    \ 'error': 'DiagnosticError',
    \ 'warning': 'DiagnosticWarning',
    \ 'info': 'DiagnosticInfo',
    \ 'hint': 'DiagnosticHint' }

let g:lightline.component_type = {
    \ 'error': 'error',
    \ 'warning': 'warning',
    \ 'info': 'middle',
    \ 'hint': 'middle' }

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
