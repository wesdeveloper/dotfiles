" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:vim_monokai_tasty_italic = 1
let g:airline_theme='monokai_tasty'

" Always show tabs
set showtabline=2

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

" We don't need to see things like -- INSERT -- anymore
" set noshowmode
