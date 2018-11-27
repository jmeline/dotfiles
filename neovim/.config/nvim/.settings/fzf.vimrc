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
nnoremap <C-p>a :Rg
nnoremap <leader>o :Files<cr>
