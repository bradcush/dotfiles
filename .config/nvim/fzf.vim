"File find and file search
nmap <leader>gf :call fzf#vim#gitfiles('', fzf#vim#with_preview({'down': '40%'}, 'up:60%'))<CR>
nmap <leader>ff :call fzf#vim#files('', fzf#vim#with_preview({'down': '40%'}, 'up:60%'))<CR>
nmap <leader>fs :call fzf#vim#ag('', fzf#vim#with_preview({'down': '40%'}, 'up:60%'))<CR>

" Narrow ag results using quickfix w/ tab
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

" Rip grep specific
command! -nargs=* Rg
  \ call fzf#vim#grep(
  \  'rg --column -g "!{.git,node_modules}/*" --line-number --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('up:80%'),
  \   1)
