set nocompatible
set encoding=utf-8
set showcmd
filetype plugin indent on

set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set autoindent
set pastetoggle=<F2>

autocmd filetype markdown,text setlocal textwidth=80
autocmd filetype make setlocal noexpandtab
autocmd filetype python setlocal tabstop=4 shiftwidth=4

syntax enable
color peachpuff
set nowrap
set ruler
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
map <F8> :!ctags -R --fields=+afiklmnsS --extra=+fq . > /dev/null 2>&1<CR>
au BufWritePost * silent ! [ -e tags ] && ctags -R --fields=+afiklmnsS --extra=+fq . > /dev/null 2>&1 &

