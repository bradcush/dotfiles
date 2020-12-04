" File finding and buffer search with custom preview
let g:fzf_preview_window = ['up:40%', 'ctrl-/']

nmap <leader>bs :Buffers<CR>
nmap <leader>ff :Files<CR>
" Search w/ grep if desired
nmap <leader>ag :Ag<CR>
" Search w/ ripgrep by default
nmap <leader>fs :Rg<CR>
nmap <leader>gf :GFiles<CR>
