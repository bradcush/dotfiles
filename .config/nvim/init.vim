" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim' " Lighter status bar
Plug 'ryanoasis/vim-devicons' " Filetype glyphs for lightline
" Sometimes fzf#install fails and install --all in the FZF plugin dir is needed
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder searching
Plug 'junegunn/fzf.vim' "Required for FZF vim integration

" Plug 'mhinz/vim-startify' " Start screen for vim
Plug 'dstein64/vim-startuptime' " Startup event timing information
Plug 'takac/vim-hardtime' " Preventing bad habits against philosophy

Plug 'neovim/nvim-lspconfig' " Common configurations for built-in LSP
Plug 'hrsh7th/nvim-compe' " Auto-completion recommended by built-in LSP

" Fill gaps in syntax highlighting support
Plug 'keith/swift.vim' " Syntax highlights for Swift
Plug 'octol/vim-cpp-enhanced-highlight' " Syntax highlights for C languages
Plug 'jxnblk/vim-mdx-js' " Syntax highlights for MDX documentation
Plug 'cespare/vim-toml' " Syntax highlights for toml configs
Plug 'stevearc/vim-arduino' " Compile, upload, and debug arduino sketches

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' } " Markdown preview in the browser
Plug 'editorconfig/editorconfig-vim' " Read editorconfig files for settings
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " Inline color code preview
Plug 'heavenshell/vim-jsdoc', { 'do': 'make install' } " JSDoc integration w/ autocompletion
Plug 'vim-test/vim-test' " Run test types with different granularity

Plug 'tpope/vim-fugitive' " Git embedded in vim
Plug 'tpope/vim-rhubarb' " Fugitive integration with GitHub
Plug 'shumphrey/fugitive-gitlab.vim' " Fugitive integration with GitLab
Plug 'mhinz/vim-signify' " Sign column git diff markers
Plug 'tpope/vim-repeat' " Expanding repeat last action
Plug 'tpope/vim-surround' " Delete, change, and add surroundings
Plug 'tpope/vim-commentary' " Commenting support
" Causing rendering issues in kitty for some reason
Plug 'tpope/vim-vinegar' " No need for the project drawer

Plug 'michaeljsmith/vim-indent-object' " Indent text objects
Plug 'kana/vim-textobj-user' " Required dep for entire/line
Plug 'kana/vim-textobj-entire' " Entire file text objects

Plug 'chriskempson/base16-vim' " Standard vim highlight groups
" Temporary plugin development for personal base16-nvim
" Plug '~/Documents/repos/base16-nvim' " Standard nvim highlight groups
" Initialize plugin system
call plug#end()

" Set the runtime path to include fzf
set rtp+=/opt/homebrew/opt/fzf

" General
filetype plugin indent on " Detect file type with auto indent
set hidden " Hidden buffers with preserved undo/marks
set autoread " Autorefresh file when it has been edited somewhere else
autocmd CursorHold,CursorHoldI * checktime " Check buffer changes on cursorhold
autocmd FocusGained,BufEnter * checktime " Check buffer changes on focus/buffer
" set mouse=a " Enable mouse scrolling
set showcmd " Show command in bottom bar
set lazyredraw " Redraw the screen less often
set backspace=2 " Backspace set two 2 chars
set autowrite " Autosave the file when loading another buffer
autocmd BufWritePre * :%s/\s\+$//e " Auto remove trailing on save
set showtabline=2 " Always show the tabline
set updatetime=100 " For a better user experience
set signcolumn=yes " Always show signcolumn to prevent shifting

" Backup/swapfiles
" Backup files are snapshots before edits are made
" Swap files contain changes you've made to a buffer
set nobackup " Never persist a backup file
set nowritebackup " Never write a backup file
set noswapfile " Never use swap files for recovery

" Cursor, scrolling, and lines
set cursorline " Highlight cursor line (Causes slowness)
" set cursorcolumn " Highlights cursor column (Causes slowness)
set colorcolumn=80 " Set print width indication line
set number " Show line numbers
set relativenumber " Show relative line numbers
" set numberwidth=4 "Number width for lines
set ruler " Show cursor position
set nowrap " Don't wrap lines
set scrolloff=2 " Scroll offset from edge to cursor

" Indentation
set expandtab " Use spaces instead of <TAB>
set tabstop=2 shiftwidth=2 " Use indent of 2 spaces
set softtabstop=2 " Use indent of 2 spaces
set autoindent " Match indentation of previous line
set smartindent " Smart autoindent when starting a new line.
set smarttab " Tab inserts a tab and backspace deletes a tab

" Searching
set ignorecase " Ignore case when searching
set smartcase " Override ignorecase when search pattern contains uppercase
set hlsearch " Highlight all search result matches
set incsearch " Highlight all search matches when typing
set showmatch " Show matching ( [ {

" Wildmenu
set wildmenu " Completion enhanced
set wildoptions=pum " Completion matches style alignment
set wildmode=longest,full " Specific menu style
set pumblend=20 " Pseudo-menu transparency

" Colorscheme and syntax
syntax on " Enable syntax highlighting
colorscheme base16-onedark " Theme requires base16-vim
" colorscheme base16-gruvbox-dark-soft " Theme requires base16-vim
set termguicolors " Enable 24-bit RGB color in the TUI
set list " List mode showing tabs, space, and trail
set listchars=space:.,trail:~,precedes:< " Represent specific listchars
" Fix syntax highlighting by referencing start of file
autocmd BufEnter * :syntax sync fromstart

" Highlighting
" Invisible characters
" hi Whitespace guifg=grey
" hi NonText guifg=grey
hi Comment gui=italic
" Diagnostic information colors
" Specified for default and virtual text
hi DiagnosticFloatingError guifg=#be5046
hi DiagnosticSignError guifg=#be5046
hi DiagnosticVirtualTextError guifg=#be5046
hi LspDiagnosticsDefaultError guifg=#be5046
hi DiagnosticFloatingWarn guifg=#e5c07b
hi DiagnosticSignWarn guifg=#e5c07b
hi DiagnosticVirtualTextWarn guifg=#e5c07b
hi LspDiagnosticsDefaultWarning guifg=#e5c07b
hi DiagnosticFloatingInfo guifg=#61afef
hi DiagnosticSignInfo guifg=#61afef
hi DiagnosticVirtualTextInfo guifg=#61afef
hi LspDiagnosticsDefaultInformation guifg=#61afef
hi DiagnosticFloatingHint guifg=#abb2bf
hi DiagnosticSignHint guifg=#abb2bf
hi DiagnosticVirtualTextHint guifg=#abb2bf
hi LspDiagnosticsDefaultHint guifg=#abb2bf

" Split windows
set splitbelow splitright " New split windows to the bottom/right

" netrw options for viewing
let g:netrw_liststyle = 4 "Show contents of current folder

" Highlight yanked contents
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Priority after lsp feedback
let g:signify_priority = 5

" Disable deleted lines count
let g:signify_sign_show_count = 0

" Change default sign
let g:signify_sign_add = '▍'
let g:signify_sign_delete = '▍'
let g:signify_sign_delete_first_line = '▍'
let g:signify_sign_change = '▍'
let g:signify_sign_change_delete = '▍'

hi SignifySignAdd guifg=#98c379
hi SignifySignDelete guifg=#be5046
hi SignifySignChange guifg=#61afef

" Vim specific configurations
" Important before any other mappings as general
" mappings like the leader key are set
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/arduino.vim
source $HOME/.config/nvim/completion.vim
source $HOME/.config/nvim/editorconfig.vim
source $HOME/.config/nvim/fugitive.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/hardtime.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/python.vim
" source $HOME/.config/nvim/startify.vim
source $HOME/.config/nvim/test.vim

" Neovim specific configurations
luafile $HOME/.config/nvim/lsp.lua
