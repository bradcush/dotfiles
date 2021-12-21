" Specify before any leader mappings
let mapleader = " " " Map leader to space

" Edit and source nvim init file
nmap <leader>rc :e ~/Documents/repos/dotfiles/.config/nvim/init.vim<CR>
nmap <leader>so :so ~/.config/nvim/init.vim<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle spell checking
nmap <leader>sp :set spell spelllang=en_us spelloptions=camel<CR>
nmap <leader>ns :set nospell<CR>

" Output highlight groups
nmap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>

" Copy from position
nnoremap Y y$

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Create a new scratch buffer
" or open the existing one
function! Scratch()
  let name = 'scratch'
  let number = bufnr(name)
    if number > 0
       execute 'buffer ' . name
       return
    endif
    execute 'enew'
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal nobuflisted
    file scratch
endfunction

" Open a scratch buffer
nmap <leader>sc :call Scratch()<CR>
