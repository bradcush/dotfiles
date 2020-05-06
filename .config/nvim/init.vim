set nocompatible " Ensure enhancements from Vi IMproved
filetype off " Detect the file type.(Set to on after Vundle)

set rtp+=/usr/local/opt/fzf " Set the runtime path to include fzf
set rtp+=~/.vim/bundle/Vundle.vim " Set the runtime path to include vundle

call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " Bundle manager

Plugin 'itchyny/lightline.vim' " Lighter status bar

Plugin 'junegunn/fzf.vim' " Fuzzy finder search files and word occurrence
Plugin 'neoclide/coc.nvim' " AutoCompletion better than YouCompleteMe

Plugin 'editorconfig/editorconfig-vim' " Read editorconfig filesof settings
Plugin 'gko/vim-coloresque' " Inline color preview
Plugin 'heavenshell/vim-jsdoc' " JSDoc integration w/ autocompletion
Plugin 'HerringtonDarkholme/yats.vim' " TS highlight syntax
Plugin 'othree/yajs.vim' " JS equivalent highlight syntax
Plugin 'maxmellon/vim-jsx-pretty' " Replaces ianks/vim-tsx potentially
Plugin 'mustache/vim-mustache-handlebars' " Syntax highlights for mustache and handlebars
Plugin 'vim-scripts/SyntaxComplete' " Syntax highlights based on OMNI completion

Plugin 'tpope/vim-fugitive' " Git embedded in vim
Plugin 'tpope/vim-repeat' " Expanding repeat last action
Plugin 'tpope/vim-surround' " Delete, change, and add surroundings
Plugin 'tpope/vim-commentary' " Commenting support
Plugin 'tpope/vim-vinegar' " No need for the project drawer

Plugin 'michaeljsmith/vim-indent-object' " Indent text objects
Plugin 'kana/vim-textobj-user' " Required dep for entire/line
Plugin 'kana/vim-textobj-entire' " Entire file text objects
Plugin 'kana/vim-textobj-line' " Line text objects

" Plugin 'vim-airline/vim-airline' " The status bar
" Plugin 'vim-airline/vim-airline-themes' " Theme for status bar
" Plugin 'scrooloose/nerdtree' " File browser like netrw
" Plugin 'ryanoasis/vim-devicons' " Icons for NERDTree and Airline
" Plugin 'Shougo/vimfiler' " Another file browser like netrw

" Color themes
Plugin 'chriskempson/base16-vim'
call vundle#end()

" General
filetype on " Detect the file type.
filetype plugin indent on " File type auto indent
syntax on " Enable syntax highlighting
set hidden " Hidden buffers with preserved undo/marks
set autoread " Autorefresh file when it has been edited somewhere else
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime

" Cursor lines
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
set wrap " Wrap lines
set scrolloff=2 " Scroll offset from edge to cursor

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

" Spell checking
" Must place after colorscheme for highlighting
set spell spelllang=en_us " Enable spellcheck with en_us dictionary
" cterm ctermbg ctermfg gui guibg guifg guisp
" undercurl and guisp not supported
" hi clear SpellBad
" hi SpellBad gui=underline guifg=red

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
