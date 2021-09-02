" File finding and buffer search with custom preview
let g:fzf_preview_window = ['up:40%', 'ctrl-/']

" Search w/ grep if desired
nmap <leader>ag :Ag<CR>
" Currently open buffers
nmap <leader>bf :Buffers<CR>
" All files in current directory
nmap <leader>ff :Files<CR>
" Search w/ ripgrep by default
nmap <leader>fs :Rg<CR>
" Git files tracked
nmap <leader>gf :GFiles<CR>
" Git files from status
nmap <leader>gs :GFiles?<CR>
