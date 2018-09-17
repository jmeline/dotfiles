set nocompatible

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

Plug 'dracula/vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFocus' }


call plug#end()

syntax on
let mapleader=','  " Map <leader> to the ',' key. 
set noshowmode			" Disables standard -INSERT-, -NORMAL-, etc "
set number			    " Show line numbers on left side
set expandtab       " Expand tab characters to space characters. 
set shiftwidth=2    " One tab is now 4 spaces.
set shiftround      " Always round up to the nearest tab.
set tabstop=2       " This one is also needed to acheive the desired effect.
" set softtabstop=2   " Enables easy removal of an indentation level. 
set smarttab        " Insert tabs on the start of a line according to shiftwidth, not tabstop

" line navigation ignores line wrap. Great for working with long lines in  vim 
map j gj 
map k gk 
" Map <Esc> to jk for faster getting out of insert mode 
inoremap jk <esc> 
" Common mistyping, saves rage 
nnoremap ; :
