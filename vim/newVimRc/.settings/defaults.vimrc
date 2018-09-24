filetype indent plugin on
syntax on

let mapleader=','               " Map <leader> to the ',' key. 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=0

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

" line navigation ignores line wrap. Great for working with long lines in  vim 
map j gj
map k gk

" Map <Esc> to jk for faster getting out of insert mode 
inoremap jk <esc> 
" Common mistyping, saves rage 
nnoremap ; :

" Prevent escape from moving the cursor one character to the left
inoremap <silent> <Esc> <C-O>:stopinsert<CR>

colorscheme dracula
