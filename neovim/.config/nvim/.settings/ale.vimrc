let b:ale_fixers = {'javascript': 'eslint'}
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'go': ['gofmt', 'goimports']
\}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
