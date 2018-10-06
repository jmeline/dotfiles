if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_theme='base16'
" let g:airline_theme='base16_eighties'
let g:airline_theme='dracula'
" let g:airline_theme='gruvbox'
" let g:airline_theme='lucius'
" let g:airline_theme='kolor'
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
