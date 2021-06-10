lua require 'init'

" vim plug
" call plug#begin('~/.vim/plugged')

" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'prettier/vim-prettier'
" Plug 'shime/vim-livedown', { 'do': 'npm i -g livedown' }
" Plug 'moll/vim-node'
" Plug 'machakann/vim-highlightedyank'
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'puremourning/vimspector'
" Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'terryma/vim-multiple-cursors'
" Plug 'HendrikPetertje/vimify'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" call plug#end()

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

" " import plugins settings
" source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/coc.vim

 " show quotes on json files
 let g:indentLine_setConceal = 0

 " nerdcommenter plugin settings
 " Add spaces after comment delimiters by default
 let g:NERDSpaceDelims = 1
 " Use compact syntax for prettified multi-line comments
 let g:NERDCompactSexyComs = 1


" " vim-javascript plugin
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1
" let g:javascript_plugin_flow = 1


" let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" " vim-node
" autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

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

" let g:coc_disable_startup_warning = 1

" Better tab experience - from https://webdevetc.com/
nmap t :BufferNext<cr>
nmap tp :BufferPrevious<cr>
nmap tc :BufferClose<cr>

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
