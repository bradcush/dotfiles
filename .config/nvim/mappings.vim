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

" Bookmarks workflow where global marks HJKL
" only are used for tagging working files
nnoremap <leader>dm :delmarks A-Z<CR>
nnoremap <leader>sm :marks HJKL<CR>
