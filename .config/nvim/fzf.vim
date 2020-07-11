" File finding and buffer search with custom preview
nmap <leader>bs :call fzf#vim#buffers('', fzf#vim#with_preview({'down': '40%'}, 'up:60%'))<CR>
nmap <leader>ff :call fzf#vim#files('', fzf#vim#with_preview({'down': '40%'}, 'up:60%'))<CR>
nmap <leader>fs :call fzf#vim#ag('', fzf#vim#with_preview({'down': '40%'}, 'up:60%'))<CR>
nmap <leader>gf :call fzf#vim#gitfiles('', fzf#vim#with_preview({'down': '40%'}, 'up:60%'))<CR>
