" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Matching strategy priority
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Specify custom chain completion
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'complete_items': ['buffers']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

"Automatically switch completions sources
let g:completion_auto_change_source = 1

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
