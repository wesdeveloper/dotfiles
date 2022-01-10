lua require 'init'

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
nmap <space>pf :CocCommand prettier.formatFile<CR>

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
nmap tc :BufferClose!<cr>

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent>qq :q<CR>

" lsp saga
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> ca :Lspsaga code_action<CR>
vnoremap <silent> ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> sd :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> sp :Lspsaga signature_help<CR>
nnoremap <silent> rr :Lspsaga rename<CR>
nnoremap <silent> dp :Lspsaga preview_definition<CR>

" Bind F8 to fixing problems with ALE
nmap <F8> :!eslint_d % --fix<CR>
" nmap <F8> :Neoformat<CR>

nnoremap <silent>mr :lua require('rest-nvim').run()<CR>
nnoremap <silent>mrd :lua require('rest-nvim').run(true)<CR>
nnoremap <silent>mcr :CocCommand rest-client.request<CR>
nnoremap <silent>cb :bw <CR>

let g:gitblame_enabled = 0

function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  return path
endfunction

autocmd VimLeavePre * silent execute 'SSave! ' . GetUniqueSessionName()

