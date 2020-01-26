filetype indent plugin on
syntax on

set clipboard=unnamed
set termguicolors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
hi xmlAttrib gui=italic cterm=italic
hi Type gui=italic cterm=italic
hi Keyword gui=italic cterm=italic
hi link jsImport Keyword
hi link jsClassBlock jsStorageClass

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=0
set ignorecase                  " Search is not case sensitive.
set smartcase                   " Will override some ignorecase properties, when using caps it will do a special search.
set incsearch                   " Enables the user to step through each search 'hit'.
set hlsearch                    " Will stop highlighting current search 'hits' when another search is performed.
set magic                       " Enables regular expressions. They are a bit like magic.
set autoindent                  " Automatically copy the previous indent level. Don't use smartindent.
set backspace=indent,eol,start
set wrap                        " Wrap text. This is also quite optional, replace with textwidth=80 is you don't want this behaviour.
set lazyredraw                  " Good performance boost when executing macros.
set viminfo^=%                  " Remember some info on close.
set ffs=unix,dos,mac            " Prioritize unix as the standard file type.
set encoding=utf-8              " Vim can now work with a whole bunch more characters.
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
set autoread                    " Reload file when changed externally.
set nobackup                    " No need for .bkp files when version control exist.
set nowritebackup               " If Vim crashes often then turn backups on again, look at docs for more information.
set noswapfile                  " Don't create swap files, nowadays we should have enough memory to store a text file.
set undodir=~/.vim_undodir      " Where do we store all this awesomeness?!?!
set undofile                    " Persistent undos are awesome!
set history=1000                " Defines the number of stored commands that Vim can remember, we have so much memory today it doesn't even matter.
set undolevels=1000             " use many muchos levels of undo
set nostartofline
set noshowmode                  " Disables standard -INSERT-, -NORMAL-, etc "
set number	                    " Show line numbers on left side
set expandtab                   " Expand tab characters to space characters.
set shiftwidth=2                " One tab is now 4 spaces.
set shiftround                  " Always round up to the nearest tab.
set tabstop=2                   " This one is also needed to acheive the desired effect.
set softtabstop=2               " Enables easy removal of an indentation level.
set smarttab                    " Insert tabs on the start of a line according to shiftwidth, not tabstop
set inccommand=nosplit          " Enables incremental command feedback
set background=dark             " Cool programmers only use dark themes
set splitbelow
set splitright

let mapleader=','               " Map <leader> to the ',' key.
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$
" line navigation ignores line wrap. Great for working with long lines in  vim
map j gj
map k gk

" Map <Esc> to jk for faster getting out of insert mode
inoremap jk <esc>

" Common mistyping, saves rage
nnoremap ; :

" Prevent escape from moving the cursor one character to the left
inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Use the hjkl keys only!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWritePre * :call DeleteTrailingWS()  "Removes trailing whitespace on any filetype

