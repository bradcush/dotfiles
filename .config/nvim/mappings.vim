map pp :VimFilerBufferDir<CR>
map vf :VimFiler<CR>

" Copy selection to clippboar
vmap yo "+y

"Buffers
map nb :new<CR>
map nv :vnew<CR>
map ss :split<CR>
map sv :vsplit<CR>
map to :to split<CR>
map tov :to vsplit<CR>
map bo :bo split<CR>
map bov :bo vsplit<CR>

map qq :Sayonara<CR>
"map qq :q<CR>
"map ww :w<CR>
"map xx :x<CR>

"File find and file search
"nmap gf :GFiles<CR>
nmap gf :call fzf#vim#gitfiles('', fzf#vim#with_preview({'down': '40%'}, 'right:40%'))<CR>
"nmap ff :Files<CR>
nmap ff :call fzf#vim#files('', fzf#vim#with_preview('right:40%'))<CR>
"nmap fs :Ag<CR>
nmap fs :call fzf#vim#ag('', fzf#vim#with_preview('right:40%'))<CR>

" Tabulous and tabs
nmap tr :TabulousRename
nmap tn :tabnew<CR>
nmap tnb :-tabnew<CR>
"nmap pt :tabprev<CR>
"nmap nt :tabnext<CR>

"Git related shortcuts
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
