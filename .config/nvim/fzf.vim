" File finding and buffer search with custom preview
let g:fzf_preview_window = ['up:40%', 'ctrl-/']

" Currently open buffers
nmap <leader>bf :Buffers<CR>
" Search w/ grep if desired
nmap <leader>ag :Ag<CR>
" Search w/ ripgrep by default
nmap <leader>fs :Rg<CR>
" All files in current directory
nmap <leader>ff :Files<CR>
" Git files tracked
nmap <leader>gf :GFiles<CR>
" Git files from status
nmap <leader>gs :GFiles?<CR>
" Help search by tag
nmap <leader>hp :Helptags<CR>
