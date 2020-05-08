let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'spell', 'gitbranch' ],
    \             [ 'readonly', 'fileinfo', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'cocstatus', 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'fileinfo': 'DynamicFileInfo',
    \   'gitbranch': 'DynamicFugitiveHead',
    \   'cocstatus': 'CocStatusDiagnostic'
    \ },
\ }

function! DynamicFileInfo()
    if expand('%:t') ==# ''
      return '[No Name]'
    endif
    return winwidth(0) > 130 ? expand('%:f') :expand('%:t')
endfunction

function! DynamicFugitiveHead()
    return winwidth(0) > 130 ? FugitiveHead() : ''
endfunction

" Custom diagnostics integrated with Coc
function! CocStatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    if get(info, 'information', 0)
        call add(msgs, 'I' . info['information'])
    endif
    return join(msgs, ' | ')
endfunction