" vim plug
call plug#begin('~/.vim/plugged')

" colorscheme
Plug 'patstockwell/vim-monokai-tasty'

" nvim-tree
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'scrooloose/nerdcommenter'
Plug 'ap/vim-css-color'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier'
Plug 'shime/vim-livedown', { 'do': 'npm i -g livedown' }
Plug 'editorconfig/editorconfig-vim'
Plug 'moll/vim-node'
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pechorin/any-jump.vim'
Plug 'puremourning/vimspector'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'yggdroot/indentline'
Plug 'HendrikPetertje/vimify'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'sebdah/vim-delve'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'davidhalter/jedi-vim'
Plug 'zivyangll/git-blame.vim'

Plug 'romgrk/barbar.nvim'
call plug#end()

let g:nvcode_termcolors=256

syntax on
filetype plugin on

set number
set relativenumber
set mouse=a
set hlsearch
set incsearch
set autoindent
set smartcase
set autoread
" allow buffer switcing without saving
set hidden
set ic
set noerrorbells
set nobackup
set nowritebackup
set noswapfile
set laststatus=2
set encoding=UTF-8
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set clipboard=unnamedplus
set nornu
set smartindent
set nohlsearch
set foldmethod=syntax
set foldlevel=99

" import plugins settings
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/barbar.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/nvimtree.vim

" always show signcolumns
set signcolumn=yes

" show quotes on json files
let g:indentLine_setConceal = 0

let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

" if you don't like a particular colour choice from `vim-monokai-tasty`, you can
" override it here. for example, to change the colour of the search hightlight:
hi search guifg=#bada55 guibg=#000000 gui=bold ctermfg=green ctermbg=black cterm=bold

" nerdcommenter plugin settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1


" vim-javascript plugin
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-node
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

" anyjump
nnoremap <leader>j :AnyJump<CR>
xnoremap <leader>j :AnyJumpVisual<CR>
nnoremap <leader>ab :AnyJumpBack<CR>
nnoremap <leader>al :AnyJumpLastResults<CR>

noremap <leader>r :source ~/.config/nvim/init.vim<CR>

" disable go_fmt_autosave
let g:go_fmt_autosave = 0

" Open close tab
map <C-\> :NvimTreeToggle<CR>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

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

" switch between buffers
nmap bp :bp<CR>
nmap bn :bn<CR>

" git blame shortcut
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>

let g:coc_disable_startup_warning = 1

" background transparent
hi Normal guibg=NONE ctermbg=NONE

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
