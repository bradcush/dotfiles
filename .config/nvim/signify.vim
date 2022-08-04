" Priority after lsp feedback
let g:signify_priority = 5

" Disable deleted lines count
let g:signify_sign_show_count = 0

" Change default sign
let g:signify_sign_add = '▍'
let g:signify_sign_delete = '▍'
let g:signify_sign_delete_first_line = '▍'
let g:signify_sign_change = '▍'
let g:signify_sign_change_delete = '▍'

" Signify highlight groups
hi SignifySignAdd guifg=#98c379
hi SignifySignDelete guifg=#be5046
hi SignifySignChange guifg=#61afef
