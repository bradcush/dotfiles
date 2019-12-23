set nocompatible " Make vim easier to use
filetype off " Detect the file type.(Set to on after Vundle)
set termguicolors " Use terminal colors

" Set the runtime path to include fzf
set rtp+=/usr/local/opt/fzf
" Set the runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " Bundle manager

Plugin 'vim-airline/vim-airline' " The status bar
Plugin 'vim-airline/vim-airline-themes' " Theme for status bar

Plugin 'junegunn/fzf.vim' " Fuzzy finder search files and word occurrence
Plugin 'neoclide/coc.nvim' " AutoCompletion better than YouCompleteMe

Plugin 'mattn/emmet-vim' " Expending abbreviation for HTML
Plugin 'gko/vim-coloresque' " Color preview

Plugin 'HerringtonDarkholme/yats.vim' " TS Highlight syntax
Plugin 'othree/yajs.vim' " JS Equivalent highlight syntax
Plugin 'vim-scripts/SyntaxComplete' " Syntax highlights based on OMNI completion
Plugin 'ianks/vim-tsx' " Syntax highlights for tsx
Plugin 'mustache/vim-mustache-handlebars' " Syntax highlights for mustache and handlebars

Plugin 'tpope/vim-fugitive' " Git embedded in vim
Plugin 'tpope/vim-repeat' " Expanding repeat last action
Plugin 'tpope/vim-surround' " Delete, change, and add surroundings
Plugin 'tpope/vim-commentary' " Commenting support
Plugin 'tpope/vim-vinegar' " No need for the project drawer

Plugin 'Yggdroot/vim-mark' " Mark words with color
Plugin 'webdevel/tabulous' " Enhance the tabline
Plugin 'vim-scripts/grep.vim' " Grep functionality

Plugin 'michaeljsmith/vim-indent-object' " Indent text objects
Plugin 'kana/vim-textobj-user' " Required dep for entire/line
Plugin 'kana/vim-textobj-entire' " Entire file text objects
Plugin 'kana/vim-textobj-line' " Line text objects

" Plugin 'scrooloose/nerdtree' " Another popular file browser
" Plugin 'ryanoasis/vim-devicons' " Icons for NERDTree and Airline

" Plugin 'Shougo/unite.vim' " Search and information display
" Plugin 'prettier/vim-prettier' " Prettier garbage for projects
" Plugin 'vim-syntastic/syntastic' " Syntax checker
" Plugin 'mhinz/vim-sayonara' " Delete buffer without killing the window
" Plugin 'Shougo/vimproc.vim' " Needed for tsuquyomi
" Plugin 'Shougo/vimfiler'
" Plugin 'Quramy/tsuquyomi' " Typescript server
" Plugin 'zivyangll/git-blame.vim' " Git blame in status bar
" Plugin 'mhartington/defx-devicons'
" Plugin 'kristijanhusak/defx-git'
" Plugin 'leafgarland/typescript-vim
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'tomasiser/vim-code-dark'
" Plugin 'Quramy/vim-js-pretty-template'
" Plugin 'jason0x43/vim-js-indent'
" Plugin 'Chiel92/vim-autoformat'

" Color themes
"Plugin /kristijanhusak/vim-hybrid-material'
"Plugin 'drewtempelmeyer/palenight.vim'
"Plugin 'rainglow/vim'
Plugin 'dracula/vim'
Plugin 'chriskempson/base16-vim'
call vundle#end()


filetype on " Detect the file type.
filetype plugin indent on " File type auto indent
syntax on

set autoread " Autorefresh file when it has been edited somewhere else
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime

" Cursor lines
set cursorline " Apparently this causes slowness.
set cursorcolumn " This too.
set colorcolumn=120 " Set print width indication line

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
set wrap " Wrap lines

" General
set showcmd " Show command in bottom bar
set scrolloff=2 " Scroll offset from edge to cursor
set lazyredraw " Not sure exactly
set autowrite " Autosave the file when loading another buffer
autocmd BufWritePre * :%s/\s\+$//e " Auto remove trailing on save
" autocmd TextChanged,TextChangedI <buffer> silent write " Autosave file on writing

" Searching
set ignorecase " Ignore when searching
set smartcase " Override ignorecase when search pattern contains uppercase
set hlsearch " Highlight all search result matches
set incsearch " Highlight all search matches when typing
set showmatch " Show matching ( [ {
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Wildmenu
set wildmenu "Completion enhanced
set wildoptions=pum "Not sure exactly
set wildmode=longest,full "Style of the menu
set pumblend=20 "Not sure exactly

set mouse=a
set list
set listchars=space:.,trail:~,precedes:<
set backspace=2

" Automatic tag closing
"inoremap <> <><Left>
"inoremap () ()<Left>
"inoremap {} {}<Left>
"inoremap [] []<Left>
"inoremap "" ""<Left>
"inoremap '' ''<Left>
"inoremap `` ``<Left>

" Autoformat files with vim-autoformat
"au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" augroup AutoFormat
  " autocmd!
  " autocmd! BufWritePre *ts norm! gg=G
" augroup END

" Fonts
let g:enable_bold_font = 1
let g:enable_italic_font = 1
set t_Co=256
set t_ut=

" Colors
colorscheme base16-onedark
let base16colorspace=256 " Access 256 colorspace
set termguicolors
""" yats " Not sure exactly
let g:yats_host_keyword = 1

" Spell checking
" Must place after colorscheme
set spell
set spell spelllang=en_us
" cterm ctermbg ctermfg gui guibg guifg guisp
" undercurl and guisp not supported
" hi clear SpellBad
" hi SpellBad gui=underline guifg=red

" netrw options for viewing
" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" Automatically open netwr on start
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/coc-config.vim
source $HOME/.config/nvim/fugitive.vim
source $HOME/.config/nvim/fzf.vim
