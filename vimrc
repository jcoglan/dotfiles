set nocompatible
set encoding=utf-8
set showcmd
filetype plugin indent on

set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set cindent

syntax enable
set nowrap
set number
set cursorline
highlight LineNr term=bold cterm=NONE ctermfg=LightGrey  ctermbg=NONE

set hlsearch
set incsearch
set ignorecase
set smartcase

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40
map <F4> :TlistToggle<CR>
map <F8> !/usr/bin/ctags -R --fields=+afiklmnsS --extra=+q .<CR>

