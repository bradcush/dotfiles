" Specify before any leader mappings
let mapleader = " " " Map leader to space

" Edit and source nvim init file
nmap <leader>rc <cmd>e ~/Documents/repos/dotfiles/.config/nvim/init.vim<cr>
" Specify with colon so command shows
nmap <leader>so :so ~/.config/nvim/init.vim<cr>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle spell checking
nmap <leader>sp <cmd>set spell spelllang=en_us spelloptions=camel<cr>
nmap <leader>ns <cmd>set nospell<cr>

" Output highlight groups
nmap <leader>hi <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Paste in visual mode without losing
" contents of the paste register
xnoremap <leader>p "_dP

" Copy from position
nnoremap Y y$

" Copy to universal clipboard
nnoremap <leader>y "*y
nmap <leader>Y "*Y

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
nmap <leader>sc :call Scratch()<cr>
