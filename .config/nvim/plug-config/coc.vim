" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> sd :call CocAction('doHover')<CR>
map <Leader>fl :CocCommand eslint.executeAutofix \| AirlineRefresh<CR>
map <Leader>ft :CocCommand tsserver.executeAutofix \| AirlineRefresh<CR>
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
