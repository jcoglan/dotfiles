autocmd!

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

au BufRead,BufNewFile *.txt set filetype=text
au BufRead,BufNewFile *.ru set filetype=ruby

au filetype haml,markdown,text setlocal textwidth=80
au filetype make setlocal noexpandtab
au filetype python setlocal tabstop=4 shiftwidth=4

let g:mustache_abbreviations = 1

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
nnoremap <F8> :TlistToggle<CR>

