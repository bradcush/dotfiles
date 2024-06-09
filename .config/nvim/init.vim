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
Plug 'mfussenegger/nvim-dap' " Debug Adapter Protocol support
Plug 'hrsh7th/cmp-nvim-lsp' " LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-buffer' " Buffer completion source for nvim-cmp
Plug 'hrsh7th/cmp-path' " Path completion source for nvim-cmp
Plug 'hrsh7th/cmp-calc' " Calc completion source for nvim-cmp
Plug 'hrsh7th/cmp-cmdline' " Command line completion source for nvim-cmp
Plug 'hrsh7th/nvim-cmp' " Completion plugin for Neovim
Plug 'hrsh7th/cmp-vsnip' " Vsnip completion source for nvim-cmp
Plug 'hrsh7th/vim-vsnip' " Snippet engine for nvim-cmp
Plug 'onsails/lspkind-nvim' " Icons for neovim built-in LSP
Plug 'github/copilot.vim' " GitHub copilot integration
Plug 'folke/trouble.nvim' " Pretty lists for LSP features

" Temporary plugin development for nvim-deeps
" Plug 'nvim-lua/plenary.nvim' " Helpful Lua utilities for Neovim
" Plug 'bradcush/nvim-deeps' " Neovim LLM assistant
" Plug '~/Documents/repos/nvim-deeps' " Neovim LLM assistant

" Fill gaps in syntax highlighting support
Plug 'keith/swift.vim' " Syntax highlights for Swift
Plug 'octol/vim-cpp-enhanced-highlight' " Syntax highlights for C languages
Plug 'jxnblk/vim-mdx-js' " Syntax highlights for MDX documentation
Plug 'cespare/vim-toml' " Syntax highlights for toml configs
Plug 'neovimhaskell/haskell-vim' " Syntax highlights for Haskell
Plug 'stevearc/vim-arduino' " Compile, upload, and debug arduino sketches
Plug 'JuliaEditorSupport/julia-vim' " LaTeX-to-Unicode for Julia

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' } " Markdown preview in the browser
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } " Lively previewing LaTeX PDF output
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

Plug 'chriskempson/base16-vim' " Standard vim highlight groups
" Temporary plugin development for personal nvim-base16
" Plug '~/Documents/repos/nvim-base16' " Standard nvim highlight groups
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
" Disable treesitter syntax highlighting for any buffer
" There might be a better way to set this globally
autocmd FileType * :lua vim.treesitter.stop()

" Highlighting
" Invisible characters
" hi Whitespace guifg=grey
" hi NonText guifg=grey
hi Comment gui=italic
" Floating window styles
hi FloatBorder guifg=#545862
hi NormalFloat guibg=#3e4451
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
" Copilot colors like comments
hi CopilotSuggestion guifg=#545862

" Highlight code snippets in markdown
let g:markdown_fenced_languages = ['typescript']

" Use preview for LaTeX previewing
let g:livepreview_previewer = 'open -a Preview'

" Split windows
set splitbelow splitright " New split windows to the bottom/right

" netrw options for viewing
let g:netrw_liststyle = 4 "Show contents of current folder

" Highlight yanked contents
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Vim specific configurations
" Important before any other mappings as general
" mappings like the leader key are set
source $HOME/.config/nvim/mappings.vim
" source $HOME/.config/nvim/arduino.vim
source $HOME/.config/nvim/editorconfig.vim
source $HOME/.config/nvim/fugitive.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/hardtime.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/python.vim
source $HOME/.config/nvim/signify.vim
" source $HOME/.config/nvim/startify.vim
source $HOME/.config/nvim/test.vim

" Neovim specific configurations
source $HOME/.config/nvim/dap.lua
" source $HOME/.config/nvim/deeps.lua
luafile $HOME/.config/nvim/globals.lua
luafile $HOME/.config/nvim/lsp.lua

" Toggle copilot on and off
nnoremap <leader>ce :Copilot enable<cr>
nnoremap <leader>cd :Copilot disable<cr>
let g:copilot_enabled = v:false
