"
" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"    ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
" Plug: {{{
if !has('nvim')
  set nocompatible
endif

function! GetVimPlug(directory)
  silent !curl -fLo &a:directory --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endfunction

" Install vim-plug if it doesn't exist
let s:nvim_config = '~/.config/nvim/autoload/plug.vim'
let s:vim_config ='~/.vim/autoload/plug.vim'
if empty(glob(s:nvim_config)) && has('nvim')
  " call GetVimPlug(s:nvim_config)
elseif empty(glob(s:vim_config)) && !has('nvim')
  " call GetVimPlug(s:vim_config)
endif

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --tern-completer
  endif
endfunction

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Raimondi/delimitMate'
" Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'Chun-Yang/vim-action-ag'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFocus' }
Plug 'scrooloose/syntastic'
"Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mkitt/tabline.vim'

"Themes
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'   " Nice devicons
Plug 'zeis/vim-kolor'
Plug 'dracula/vim'
"C / C++
Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
"Clojure and ClojureScript
Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure', 'clojurescript'] }
Plug 'tpope/vim-fireplace', { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure', 'clojurescript'] }
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure', 'clojurescript'] }
"Ruby
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
"Python
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'mitsuhiko/vim-python-combined', { 'for': 'python' }
" Plug 'bentayloruk/vim-react-es6-snippets', { 'for': 'javascript.jsx' }
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript.jsx' }
"CSS/LESS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'md'] }
" Elm
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'juliosueiras/cakebuild.vim', { 'for': 'csx' }
call plug#end()
"}}}
" General: {{{
set guifont=Sauce\ Code\ Powerline:h13:cANSI
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=0
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
set autoread                    " Reload file when changed externally.
set nobackup                    " No need for .bkp files when version control exist.
set nowritebackup               " If Vim crashes often then turn backups on again, look at docs for more information.
set noswapfile                  " Don't create swap files, nowadays we should have enough memory to store a text file.
set undodir=~/.vim_undodir      " Where do we store all this awesomeness?!?!
set undofile                    " Persistent undos are awesome!
set history=1000                " Defines the number of stored commands that Vim can remember, we have so much memory today it doesn't even matter.
set undolevels=1000             " use many muchos levels of undo
let mapleader=','               " Map <leader> to the ',' key. This is used to extend Vims functionality without overwriting any standard bindings.
" let g:mapleader=','             " Do this globally too.
set mouse=a                     " Enable use of the mouse for all modes
set shortmess+=I                " hide the launch screen
""http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
" works only for OS X
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  set clipboard^=unnamed
  set clipboard^=unnamedplus"
endif

" }}}
" Formatting: {{{
set expandtab                   " Expand tab characters to space characters.
set shiftwidth=2                " One tab is now 4 spaces.
set shiftround                  " Always round up to the nearest tab.
set tabstop=2                   " This one is also needed to acheive the desired effect.
set softtabstop=2               " Enables easy removal of an indentation level.
set smarttab                    " Insert tabs on the start of a line according to shiftwidth, not tabstop
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set autoindent                  " Automatically copy the previous indent level. Don't use smartindent.
set backspace=indent,eol,start
set wrap                        " Wrap text. This is also quite optional, replace with textwidth=80 is you don't want this behaviour.
set lazyredraw                  " Good performance boost when executing macros.
set viminfo^=%                  " Remember some info on close.
" }}}
" Searching: {{{
set ignorecase                  " Search is not case sensitive.
set smartcase                   " Will override some ignorecase properties, when using caps it will do a special search.
set incsearch                   " Enables the user to step through each search 'hit'.
set hlsearch                    " Will stop highlighting current search 'hits' when another search is performed.
set magic                       " Enables regular expressions. They are a bit like magic.
" }}}
" UI: {{{
set ffs=unix,dos,mac            " Prioritize unix as the standard file type.
" set encoding=utf-8              " Vim can now work with a whole bunch more characters.
set scrolloff=7                  " The screen will only scroll when the cursor is 7  characters from the top/bottom.
set foldmethod=marker
set noeb vb t_vb=

set wildmenu                    " Enable the 'autocomplete' menu when in command mode (':'). make tab completion for files/buffers act like bash
set wildmode=list:full          " Show a list when pressing tab and complete first full match
" set cursorline                  " For easier cursor spotting. Completly optional though. Underline the current line
set shortmess=a                 " Shorten some command mode messages, will keep you from having to hit ENTER all the time.
set cmdheight=1                 " Will also reduce the frequency of having to press ENTER.
" set stal=2                      " Always show tabs.

set mat=2                       " How long the highlight will last.
set number                      " Show line numbers on left side.
" set relativenumber             " Enables the user to easilty see the relative distance between cursor and target line.
set ttyfast                     " Will send characters over a terminal connection faster. We do have pretty fast computers after all.
set ruler                       " Always show current cursor position.
set hidden                      " Abandon buffer when closed.
set showtabline=0               " Remove tabline across the top. 1: default
set showmatch                   " Will highlight matching brackets.
set showcmd                     " Show partial commands in the last line of the screen
set linespace=0                 " set line-spacing to minimum
set nojoinspaces                " set line-spacing to minimum

syntax on                       " The most important feature when coding. Please give!.
set laststatus=2                " Always have a status line, this is required in order for Lightline to work correctly.
set noshowmode                  " Disables standard -INSERT-, -NORMAL-, etc... Lightline will provide a better looking one for us.
set t_Co=256                    " This will 'force' terminals to use 256 colors, enabling Lightline and the colorscheme to look correct.
" }}}
" GVIM: {{{
if has('gui_running')
  set guioptions-=m
  set guioptions-=e
  set guioptions-=T
  set guioptions-=r
  set vb noeb novb t_vb=
endif
" }}}
" Fugitive Settings: {{{
function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction
" }}}
" vim-JSX Settings: {{{
""""""""""""""""""""
let g:jsx_ext_required = 0              " jsx syntax highlighting for all javascript files
highlight link xmlEndTag xmlTag         " https://github.com/mxw/vim-jsx/issues/87 - fixes closing tag miscoloration
" }}}
" colorscheme Settings: {{{
""""""""""""""""""
" colorscheme badwolf
" let base16colorspace=256                  " Access colors present in 256 colorspace
" colorscheme base16-eighties
" colorscheme base16-ocean
" colorscheme base16-solarized-dark
" colorscheme onedark                       " Atom Text editor's theme
" colorscheme gruvbox
" let g:kolor_italic=1                    " Enable italic. Default: 1
" let g:kolor_bold=1                      " Enable bold. Default: 1
" let g:kolor_underlined=0                " Enable underline. Default: 0
" let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0
" colorscheme kolor
colorscheme dracula

set background=dark             " Cool programmers only use dark themes.
" }}}
" airline Settings: {{{
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
" let g:airline#extensions#tabline#enabled = 1 "Enable for buffer
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
" }}}
" ctrlp Settings: {{{
""""""""""""""""""
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
end

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" enable faster searching using ag if enabled https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  unlet g:ctrlp_user_command
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_max_files = 0

" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|\public$\|log\|tmp$\|node_modules$\|Build$',
      \ 'file': '\.so$\|\.dat$\|\.DS_Store$\|\.dll$\|\.pyc$\|\.cs$|\.xml$'
      \ }

" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_working_path_mode = '0'
" }}}
" NerdTree Settings: {{{
"""""""""""""""""""""
" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=1         " Show the bookmarks table on startup
let NERDTreeShowFiles=1             " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1            " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1   " Highlight the selected entry in the tree

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

" }}}
" Syntastic Settings: {{{
" Override eslint with local version where necessary.
" Avoids having to install eslint plugins globally
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif"
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_debug = 1;
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" }}}
" Ultisnips and YouCompleteMe Settings: {{{
""""""""""""""""""""""""""""""""""""""""
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = []
" let g:ycm_key_list_previous_completion = []
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsListSnippets="<c-l>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsEditSplit="vertical"
" }}}
" delimitMate Settings: {{{
"""""""""""""""""""""""
let delimitMate_jump_expansion = 1  " nice feature to have jumping when creating ending braces. Read 'delimitMate_jump_expansion'
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
" }}}
" Vimwiki Settings: {{{
"""""""""""""""""""
let g:vimwiki_list = [
      \ {'path': '~/Projects/journal/vimwiki'},
      \ {'path': '~/Projects/journal/twwiki/twwiki'},
      \ {'path': '~/Projects/journal/spiritualwiki'},
      \ {'path': '~/Projects/journal/linuxwiki'} ]

let g:vimwiki_diary_months = {
      \ 1: 'January', 2: 'February', 3: 'March',
      \ 4: 'April', 5: 'May', 6: 'June',
      \ 7: 'July', 8: 'August', 9: 'September',
      \ 10: 'October', 11: 'November', 12: 'December'
      \ }

let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_folding = 'expr'
" }}}
" Python Settings: {{{
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_virtualenv = 1
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" }}}
" Rainbow Parentheses: {{{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" }}}
" VimPolygot: {{{
let g:ployglot_disabled = ['elm']
" }}}
"Custom Mapping: {{{
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" nnoremap <C-L> :nohl<CR><C-L>
nnoremap <space> :noh<CR><C-L>

" Faster shortcut for commenting lines using tcomment
map <leader>c <c-_><c-_>

" line navigation ignores line wrap. Great for working with long lines in  vim
map j gj
map k gk

" Map <Esc> to jk for faster getting out of insert mode
inoremap jk <esc>
" Common mistyping, saves rage
nnoremap ; :
nnoremap <silent><F2> :set rnu!<CR>
nnoremap <silent><F3> :set nu!<CR>
" Neovim sends <BS> instead of H^
" workaround for https://github.com/neovim/neovim/issues/2048
if has('nvim')
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  " nmap <BS> <C-W>h
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
  " Enables incremental command feedback
  if exists('&inccommand')
    set inccommand=nosplit
  endif
else
  map <C-H> <C-W><C-H>
endif

set splitbelow
set splitright
" Speed up scrolling of the viewport slightly
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Use the hjkl keys only!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" use * to search current word in normal mode
nmap * <Plug>AgActionWord
" use * to search selected text in visual mode
vmap * <Plug>AgActionVisual

" File Type Settings
"autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
"au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
"au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
"au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.js setlocal expandtab ts=2 sw=2 sts=2
" }}}
" Custom Functions: {{{

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
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <C-p>a :Rg
nnoremap <leader>o :Files<cr>

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Prevent escape from moving the cursor one character to the left
inoremap <silent> <Esc> <C-O>:stopinsert<CR>

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces() "Removes trailing whitespace on any filetype
au BufRead *.html,*.ejs set filetype=htmlm4
au BufRead .aliasrc set filetype=bash

" sort words within a line
command! -nargs=0 -range SortWordsInLine <line1>,<line2>call setline('.',join(sort(split(getline('.'),' ')),' '))
" }}}

set nofsync
