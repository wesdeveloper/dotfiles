syntax enable
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
set foldmethod=indent
set clipboard=unnamedplus
set nornu
set smartindent
set nohlsearch

" vim plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ayu-theme/ayu-vim'
Plug 'sickill/vim-monokai'
Plug 'fatih/vim-go', { 'do': ':goupdatebinaries' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'powerline/powerline-fonts'
Plug 'dense-analysis/ale'
Plug 'yggdroot/indentline'
Plug 'HendrikPetertje/vimify'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'sebdah/vim-delve'
call plug#end()

filetype plugin on

source $HOME/.config/nvim/vim-plug/vimspector.vim
source $HOME/.config/nvim/vim-plug/fzf.vim

" colorscheme monokai
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
let g:airline_theme='monokai_tasty'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" this is handled by lightline
set noshowmode

" show file path in lightline
" https://github.com/itchyny/lightline.vim/issues/87#issuecomment-119130738
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
      \ 'active': {
      \   'right': [['lineinfo'], ['fileformat', 'filetype']]
      \ },
      \ 'component_function': {
      \   'filename': 'lightlinefilename'
      \ },
      \ 'component': {
      \   'lineinfo': "[%l:%-v] [%{printf('%03d/%03d',line('.'),line('$'))}]",
      \ }
      \ }
function! Lightlinefilename()
  return expand('%')
endfunction

let g:highlightedyank_highlight_duration = 200


" if you don't like a particular colour choice from `vim-monokai-tasty`, you can
" override it here. for example, to change the colour of the search hightlight:
hi search guifg=#bada55 guibg=#000000 gui=bold ctermfg=green ctermbg=black cterm=bold

nmap cc :Commands<CR>

" nerdcommenter plugin settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1


" vim-javascript plugin
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


" vim transparent background
let t:is_transparent = 0
function! Toggle_transparent()
  if t:is_transparent == 0
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 1
  else
    set background=dark
    let t:is_tranparent = 0
  endif
endfunction
nnoremap <C-T> : call Toggle_transparent()<CR>

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-node
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

" anyjump
nnoremap <leader>j :AnyJump<CR>
xnoremap <leader>j :AnyJumpVisual<CR>
nnoremap <leader>ab :AnyJumpBack<CR>
nnoremap <leader>al :AnyJumpLastResults<CR>

noremap <leader>r :YcmRestartServer<CR>
noremap <leader>R :source ~/.config/nvim/init.vim<CR>

" indent all file
map <F7> gg\=G<C-o><C-o>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" disable go_fmt_autosave
let g:go_fmt_autosave = 0

" Better tab experience - from https://webdevetc.com/
nmap tn :tabnew<cr>
nmap t :tabnext<cr>
nmap tm :tabmove
nmap tc :tabclose<cr>
nmap to :tabonly<cr>

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_liststyle = 3


let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1
let g:NERDSpaceDelims = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:airline_powerline_fonts = 1


map <C-\> :NERDTreeToggle<CR>


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

let g:coc_disable_startup_warning = 1

" background transparent
hi Normal guibg=NONE ctermbg=NONE
