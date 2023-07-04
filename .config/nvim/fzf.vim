" File finding and buffer search with custom preview
let g:fzf_preview_window = ['up:40%', 'ctrl-/']

" Search w/ grep if desired
nmap <leader>ag :Ag<cr>
" Currently open buffers
nmap <leader>bf :Buffers<cr>
" All files in current directory
nmap <leader>ff :Files<cr>
" Search w/ ripgrep by default
nmap <leader>fs :Rg<cr>
" Git files tracked
nmap <leader>gf :GFiles<cr>
" Git files from status
nmap <leader>gs :GFiles?<cr>
" Helptags for documentation
nmap <leader>ht :Helptags<cr>
