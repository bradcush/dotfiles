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

" Copy from position
nnoremap Y y$

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
