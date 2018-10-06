let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks") 
let NERDTreeShowBookmarks=1           " Show the bookmarks table on startup 
let NERDTreeShowFiles=1              
let NERDTreeShowHidden=1              " Show hidden files, too 
let NERDTreeQuitOnOpen=1              " Quit on opening files from the tree 
let NERDTreeHighlightCursorline=1   
" Highlight the selected entry in the tree 
" Use a single click to fold/unfold directories and a double click to open files 
let NERDTreeMouseMode=2 
" Don't display these kinds of files 
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',       
			\ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__',
			\ '\.DS_Store' ] 
let g:NERDTreeDirArrows = 1 
let g:NERDTreeDirArrowExpandable = '-' 
let g:NERDTreeDirArrowExpandable = '▸' 
let g:NERDTreeDirArrowCollapsible = '▾' 
" Locate file in nerdTree via F4 
map <F4> :NERDTreeFind<CR> 
nnoremap <leader>n :NERDTreeFocus<CR> 
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR> 
nnoremap <leader>N :NERDTreeClose<CR>
