" My .vimrc
" http://pastebin.com/u7b5gZj6
" I got a lot of the settings from this pastebin. Thanks!
" VUNDLE: {
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'

    " Functional:
    Plugin 'bling/vim-airline'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'

    " Pretty:
    Plugin 'mkitt/tabline.vim'
    Plugin 'itchyny/lightline.vim'
    Plugin 'morhetz/gruvbox'
    Plugin 'zeis/vim-kolor'

    " Language:
    "   Python:
    call vundle#end()
    " }

" Airline: {
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.space = "\ua0"
" }

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Show partial commands in the last line of the screen
set showcmd

"Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
set visualbell " Use visual bell instead of beeping when doing something wrong

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" General: {
    set autoread " Reload file when changed externally.
    set nobackup " No need for .bkp files when version control exist.
    set nowritebackup " If Vim crashes often then turn backups on again, look at docs for more information.
    set noswapfile " Don't create swap files, nowadays we should have enough memory to store a text file.

    "set undodir=~/.vim_undodir " Where do we store all this awesomeness?!?!
    set undofile " Persistent undos are awesome!

    let mapleader=',' " Map <leader> to the ',' key. This is used to extend Vims functionality without overwriting any standard bindings.
    let g:mapleader=',' " Do this globally too.
    set history=1000 " Defines the number of stored commands that Vim can remember, we have so much memory today it doesn't even matter.

    " And reset the terminal code for the visual bell. If visualbell is set, and
    " this line is also included, vim will neither flash nor beep. If visualbell
    " is unset, this does nothing.
    set t_vb=
    set mouse=a " Enable use of the mouse for all modes
" }

" Formatting: {
    set expandtab " Expand tab characters to space characters.
    set shiftwidth=4 " One tab is now 4 spaces.
    set shiftround " Always round up to the nearest tab.
    set tabstop=4 " This one is also needed to acheive the desired effect.
    set softtabstop=4 " Enables easy removal of an indentation level.

    set autoindent " Automatically copy the previous indent level. Don't use smartindent.
    set backspace=indent,eol,start
    set wrap " Wrap text. This is also quite optional, replace with textwidth=80 is you don't want this behaviour.
    set lazyredraw " Good performance boost when executing macros.
    set viminfo^=% " Remember some info on close.
" }

" Searching: {
    set ignorecase " Search is not case sensitive.
    set smartcase " Will override some ignorecase properties, when using caps it will do a special search.
    set incsearch " Enables the user to step through each search 'hit'.
    set hlsearch " Will stop highlighting current search 'hits' when another search is performed.
    set magic " Enables regular expressions. They are a bit like magic.
" }

" UI: {
    set ffs=unix,dos,mac " Prioritize unix as the standard file type.
    set encoding=utf-8 " Vim can now work with a whole bunch more characters.
    set scrolloff=7 " The screen will only scroll when the cursor is 7 characters from the top/bottom.
    " set foldmethod=indent

    set wildmenu " Enable the 'autocomplete' menu when in command mode (':').
    set cursorline " For easier cursor spotting. Completly optional though.
    set shortmess=a " Shorten some command mode messages, will keep you from having to hit ENTER all the time.
    set cmdheight=2 " Will also reduce the frequency of having to press ENTER.
    set stal=2 " Always show tabs.

    set showmatch " Will highlight matching brackets.
    set mat=2 " How long the highlight will last.
    set number " Show line numbers on left side.
    "set relativenumber " Enables the user to easilty see the relative distance between cursor and target line.
    set ttyfast " Will send characters over a terminal connection faster. We do have pretty fast computers after all.
    set ruler " Always show current cursor position.
    set hidden " Abandon buffer when closed.

    syntax on " The most important feature when coding. Please give!.
    set laststatus=2 " Always have a status line, this is required in order for Lightline to work correctly.
    set noshowmode " Disables standard -INSERT-, -NORMAL-, etc... Lightline will provide a better looking one for us.
    set t_Co=256 " This will 'force' terminals to use 256 colors, enabling Lightline and the colorscheme to look correct.
    set background=dark " Cool programmers only use dark themes.

    let g:kolor_italic=1                    " Enable italic. Default: 1
    let g:kolor_bold=1                      " Enable bold. Default: 1
    let g:kolor_underlined=0                " Enable underline. Default: 0
    let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0
    colorscheme kolor " I love this theme. Big kudos to the developer of this theme.

    let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
    "

" Mapping:{
    map Y y$ " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy

    nnoremap <C-L> :nohl<CR><C-L> " Map <C-L> (redraw screen) to also turn off search highlighting until the

    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    " window
    nmap <leader>sw<left>  :topleft  vnew<CR>
    nmap <leader>sw<right> :botright vnew<CR>
    nmap <leader>sw<up>    :topleft  new<CR>
    nmap <leader>sw<down>  :botright new<CR>
    " buffer
    nmap <leader>s<left>   :leftabove  vnew<CR>
    nmap <leader>s<right>  :rightbelow vnew<CR>
    nmap <leader>s<up>     :leftabove  new<CR>
    nmap <leader>s<down>   :rightbelow new<CR>
" }

" Custom Functions: {
    fun! <SID>StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun
    " autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
    "
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces() "Removes trailing whitespace on any filetype
" }
