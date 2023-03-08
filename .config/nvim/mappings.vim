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

" Paste in visual mode without losing
" contents of the paste register
xnoremap <leader>p "_dP

" Cursor to beginning of command-line because
" the default CTRL-B is taken over by tmux
" :h cmdline-editing explains more
cnoremap <C-a> <Home>

" Create a new scratch buffer
" or open the existing one
function! Scratch()
    let name = 'scratch'
    let number = bufnr(name)
    if number > 0
        execute 'buffer ' . name
    else
        execute 'enew'
        file scratch
    endif
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal nobuflisted
endfunction

" Open a scratch buffer
nmap <leader>sc :call Scratch()<CR>

" Bookmarks workflow where global marks ABCDE
" only are used for tagging working files
nnoremap <leader>sm :marks ABCDE<CR>
nnoremap <leader>dm :delmarks ABCDE<CR>
" Set special marks using numbers
" to retain visual keyboard order
nnoremap m1 mA
nnoremap m2 mB
nnoremap m3 mC
nnoremap m4 mD
nnoremap m5 mE
" Naviate to special marks with <leader>number
" so there is no mapping overlap and no delay
nnoremap <leader>1 `Azz
nnoremap <leader>2 `Bzz
nnoremap <leader>3 `Czz
nnoremap <leader>4 `Dzz
nnoremap <leader>5 `Ezz
