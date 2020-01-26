let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}

" let g:deoplete#sources#jedi#python_path = 'python3'
" call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
" let g:deoplete#disable_auto_complete = 1

call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})

call deoplete#initialize()
