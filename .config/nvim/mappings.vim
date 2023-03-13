" Specify before any leader mappings
let mapleader = " " " Map leader to space

" Edit and source nvim init file
nmap <leader>rc <cmd>e ~/Documents/repos/dotfiles/.config/nvim/init.vim<CR>
" Specify with colon so command shows
nmap <leader>so :so ~/.config/nvim/init.vim<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle spell checking
nmap <leader>sp <cmd>set spell spelllang=en_us spelloptions=camel<CR>
nmap <leader>ns <cmd>set nospell<CR>

" Output highlight groups
nmap <leader>hi <cmd>so $VIMRUNTIME/syntax/hitest.vim<CR>

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
nmap <leader>sc :call Scratch()<CR>

" Bookmarks workflow where global marks ASDFG
" only are used for tagging working files
nnoremap <leader>sm :marks ASDFG<CR>
nnoremap <leader>dm :delmarks ASDFG<CR>
" Set special marks using left hand home
" row to retain visual keyboard order
nnoremap ma mA
nnoremap ms mS
nnoremap md mD
nnoremap mf mF
nnoremap mg mG
" Naviate to special marks with <leader>m<letter>
" so there is no mapping overlap and no delay
nnoremap <leader>ma `Azz
nnoremap <leader>ms `Szz
nnoremap <leader>md `Dzz
nnoremap <leader>mf `Fzz
nnoremap <leader>mg `Gzz
