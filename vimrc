set nocompatible
set encoding=utf-8
set directory=~/.vim/swap/
execute pathogen#infect()

set hlsearch incsearch ignorecase smartcase
set pastetoggle=<F2>
set showcmd

syntax enable
color peachpuff
set cursorline nowrap number ruler
highlight LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE

filetype plugin indent on
set expandtab shiftwidth=2 tabstop=2
set autoindent
set backspace=indent,eol,start

autocmd filetype haml,markdown,text setlocal textwidth=80
autocmd filetype make setlocal noexpandtab
autocmd filetype python setlocal tabstop=4 shiftwidth=4

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
nnoremap <F8> :TlistToggle<CR>

