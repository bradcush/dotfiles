" Show dev icons with entries
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" Never change the current directory
let g:startify_change_to_dir = 0

" Keep Startify contents up-to-date
let g:startify_update_oldfiles = 0

" Disable random quotes header
let g:startify_custom_header = []

" Git modified files
function! s:git()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Specify enabled lists w/ titles
let g:startify_lists = [
    \ { 'type': 'files', 'header': ['   MRU'] },
    \ { 'type': 'dir', 'header': ['   MRU '. getcwd()] },
    \ { 'type': function('s:git'), 'header': ['   Modified']},
    \ { 'type': 'commands', 'header': ['   Commands'] } ]

" Commonly used commands
let g:startify_commands = [
    \ ':so $VIMRUNTIME/syntax/hitest.vim',
    \ ':e ~/Documents/repos/dotfiles/.config/nvim/init.vim',
    \ ':set spell spelllang=en_us spelloptions=camel',
    \ ':! open ~/Documents/repo' ]

" Hightlight the current line
autocmd User Startified setlocal cursorline

" Go boack to start screen
nnoremap <leader>st :Startify<CR>
