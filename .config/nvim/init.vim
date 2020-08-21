" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim' " Lighter status bar
Plug 'junegunn/fzf.vim' " Fuzzy finder search files and word occurrence

" Requires dependencies install using yarn
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " AutoCompletion better than YouCompleteMe
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' } " Markdown preview in the browser

Plug 'editorconfig/editorconfig-vim' " Read editorconfig filesof settings
Plug 'gko/vim-coloresque' " Inline color preview
Plug 'heavenshell/vim-jsdoc' " JSDoc integration w/ autocompletion
Plug 'HerringtonDarkholme/yats.vim' " TS highlight syntax
Plug 'othree/yajs.vim' " JS equivalent highlight syntax
Plug 'maxmellon/vim-jsx-pretty' " Replaces ianks/vim-tsx potentially
Plug 'mustache/vim-mustache-handlebars' " Syntax highlights for mustache and handlebars
Plug 'vim-scripts/SyntaxComplete' " Syntax highlights based on OMNI completion
Plug 'jackguo380/vim-lsp-cxx-highlight' " C syntax highlighting
Plug 'jxnblk/vim-mdx-js' " Syntax highlights for the MDX documentation

Plug 'tpope/vim-fugitive' " Git embedded in vim
Plug 'tpope/vim-repeat' " Expanding repeat last action
Plug 'tpope/vim-surround' " Delete, change, and add surroundings
Plug 'tpope/vim-commentary' " Commenting support
" Causing rendering issues in kitty for some reason
Plug 'tpope/vim-vinegar' " No need for the project drawer

Plug 'michaeljsmith/vim-indent-object' " Indent text objects
Plug 'kana/vim-textobj-user' " Required dep for entire/line
Plug 'kana/vim-textobj-entire' " Entire file text objects
Plug 'kana/vim-textobj-line' " Line text objects

" Plug 'vim-airline/vim-airline' " The status bar
" Plug 'vim-airline/vim-airline-themes' " Theme for status bar
" Plug 'scrooloose/nerdtree' " File browser like netrw
" Plug 'ryanoasis/vim-devicons' " Icons for NERDTree and Airline
" Plug 'Shougo/vimfiler' " Another file browser like netrw

" Color themes
Plug 'chriskempson/base16-vim'
" Initialize plugin system
call plug#end()

" Set the runtime path to include fzf
set rtp+=/usr/local/opt/fzf

" General
filetype on " Detect the file type.
filetype plugin indent on " File type auto indent
syntax on " Enable syntax highlighting
set hidden " Hidden buffers with preserved undo/marks
set autoread " Autorefresh file when it has been edited somewhere else
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime

" Backup
" Backup files are snapshots before edits are made
" Swap files contain changes you've made to a buffer
set nobackup " Never persist a backup file
set nowritebackup " Never write a backup file
set noswapfile " Never use swap files for recovery

" Cursor lines
" Causing slowness specifically navigating some files
set cursorline " Highlight cursor line (Causes slowness)
set cursorcolumn " Highlights cursor column (Causes slowness)
set colorcolumn=80 " Set print width indication line

" Indentation
set expandtab " Use spaces instead of <TAB>
set tabstop=2 shiftwidth=2 " Use indent of 2 spaces
set softtabstop=2 " Use indent of 2 spaces
set autoindent " Match indentation of previous line
set smartindent " Smart autoindent when starting a new line.
set smarttab " Tab inserts a tab and backspace deletes a tab

" Lines
set number " Show line numbers
set relativenumber " Show relative line numbers
" set numberwith=4 "Number width for lines
set ruler " Show cursor position
set nowrap " Don't wrap lines
set scrolloff=2 " Scroll offset from edge to cursor

" Coc recommended
set updatetime=300 " For a better user experience
set signcolumn=yes " Always show signcolumn to prevent shifting

" General
" set mouse=a " Enable mouse scrolling
set showcmd " Show command in bottom bar
set lazyredraw " Redraw the screen less often
set backspace=2 " Backspace set two 2 chars
set autowrite " Autosave the file when loading another buffer
autocmd BufWritePre * :%s/\s\+$//e " Auto remove trailing on save

" Searching
set ignorecase " Ignore when searching
set smartcase " Override ignorecase when search pattern contains uppercase
set hlsearch " Highlight all search result matches
set incsearch " Highlight all search matches when typing
set showmatch " Show matching ( [ {

" Wildmenu
set wildmenu "Completion enhanced
set wildoptions=pum "Not sure exactly
set wildmode=longest,full "Style of the menu
set pumblend=20 "Not sure exactly

" Colors
colorscheme base16-onedark " Theme requires base16-vim
let base16colorspace=256 " Access colors in 256 colorspace for base16-vim
set termguicolors " Enable 24-bit RGB color in the TUI

" Highlighting
set list " List mode showing tabs, space, and trail
set listchars=space:.,trail:~,precedes:<
" Fix syntax highlighting by referencing start of file
autocmd BufEnter * :syntax sync fromstart
" Set whitespace character highlight
" hi Whitespace ctermfg=grey guifg=grey
" hi NonText ctermfg=grey guifg=grey

" Highlight yanked contents for neovim
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Spell checking
" Must place after colorscheme for highlighting
set spell spelllang=en_us " Enable spellcheck with en_us dictionary
" cterm ctermbg ctermfg gui guibg guifg guisp
" undercurl and guisp not supported in some terminals
hi SpellBad gui=underline guisp=NONE
" Enable italic comments
hi Comment cterm=italic gui=italic

" Split windows
set splitbelow splitright " New windows to the bottom/right

" netrw options for viewing
let g:netrw_liststyle = 4 "Show contents of current folder
" let g:netrw_liststyle = 3 "Show contents of entire tree

source $HOME/.config/nvim/coc-config.vim
source $HOME/.config/nvim/editorconfig.vim
source $HOME/.config/nvim/fugitive.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/python.vim
