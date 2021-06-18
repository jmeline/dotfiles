filetype off
"Automatically install Vim-Plug if it is not yet installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "| Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFocus' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'w0rp/ale'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'   " Nice devicons
" Plug 'ternjs/tern_for_vim' ", { 'do': 'npm install && npm install -g tern' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion'
Plug 'vimwiki/vimwiki'

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'mattn/emmet-vim'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Javascript support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat', { 'for': 'javascript' }
"Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug '~/.config/nvim/plugged/dracula_pro/vim/'
" Markdown support
Plug 'gabrielelana/vim-markdown', { 'for': 'md' }

"Clojure support
Plug 'Olical/conjure', { 'tag': 'v4.20.0' }
Plug 'clojure-vim/async-clj-omni'

call plug#end()

