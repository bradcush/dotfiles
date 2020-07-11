" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gtd <Plug>(coc-definition)
nmap <silent> gty <Plug>(coc-type-definition)
nmap <silent> gti <Plug>(coc-implementation)
nmap <silent> gtr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming across documents
nmap <leader>rn <Plug>(coc-rename)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Using CocList
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr> " Show all diagnostics
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr> " Manage extensions
nnoremap <silent> <space>c  :<C-u>CocList commands<cr> " Show commands
nnoremap <silent> <space>o  :<C-u>CocList outline<cr> " Find symbol of current document
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr> " Search workspace symbols
nnoremap <silent> <space>j  :<C-u>CocNext<CR> " Do default action for next item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR> " Do default action for previous item.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR> " Resume latest coc list

command! -nargs=0 Prettier :CocCommand prettier.formatFile
