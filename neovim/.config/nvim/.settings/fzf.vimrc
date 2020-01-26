" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --no-ignore --line-number --no-heading --color=always --smart-case --glob "!{.git,node_modules}/*"'.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)
"
command! -bang -nargs=* Find call fzf#vim#grep("rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob '!.git' --glob '!node_modules' --color 'always'".shellescape(<q-args>), 1, <bang>0)

nnoremap <leader>o :Files<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>g :GitFiles<cr>

" Using floating windows of Neovim to start fzf
" if has('nvim')
"   let $FZF_DEFAULT_OPTS .= ' --border --margin=0,4'
"
"   function! FloatingFZF()
"     let width = float2nr(&columns * 0.9)
"     let height = float2nr(&lines * 0.6)
"     let opts = { 'relative': 'editor',
"                \ 'row': (&lines - height) / 2,
"                \ 'col': (&columns - width) / 2,
"                \ 'width': width,
"                \ 'height': height }
"
"     let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"     call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
"   endfunction
"
"   let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" endif
