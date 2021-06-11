lua require 'init'

" set hlsearch
" set incsearch
" set autoindent
" set smartcase
" set autoread
" " allow buffer switcing without saving
" set ic
" set noerrorbells
" set laststatus=2
" set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" set nohlsearch
" set foldmethod=syntax
" set foldlevel=99

let g:highlightedyank_highlight_duration = 1000

" show quotes on json files
let g:indentLine_setConceal = 0

" nerdcommenter plugin settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-node
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

noremap <leader>s :source ~/.config/nvim/init.vim<CR>


" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

nmap <space>r :RnvimrToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Copy and paste
noremap <Leader>y "+y
noremap <Leader>p "+p

" Ident
map <Leader>i gg=G
map <Tab> >>
map <S-Tab> <<

" git blame shortcut
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>

" Better tab experience - from https://webdevetc.com/
nmap t :BufferNext<cr>
nmap tp :BufferPrevious<cr>
nmap tc :BufferClose<cr>

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" lsp saga
nnoremap <silent>ca :Lspsaga code_action<CR>
vnoremap <silent>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>sd :Lspsaga hover_doc<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent>gd :Lspsaga preview_definition<CR>

nnoremap <silent>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent>gs :Lspsaga signature_help<CR>

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" Bind F8 to fixing problems with ALE
nmap <F8> :!eslint_d % --fix<cr>

