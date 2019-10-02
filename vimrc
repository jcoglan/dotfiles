autocmd!

set noerrorbells

set nocompatible
set encoding=utf-8
set directory=~/.vim/swap/
execute pathogen#infect()

set hlsearch incsearch ignorecase smartcase
set pastetoggle=<F2>
set showcmd
set scrolloff=4
set wildmenu

syntax enable
color peachpuff
set cursorline nowrap number ruler
highlight LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE

filetype plugin indent on
set expandtab shiftwidth=2 softtabstop=2
set autoindent
set backspace=indent,eol,start
set nojoinspaces

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile Berksfile,Gemfile,*.gemspec,*.ru set filetype=ruby
au BufRead,BufNewFile *.txt set filetype=text

au filetype markdown,tex,text setlocal formatoptions+=t textwidth=80
au filetype c,cpp,make setlocal noexpandtab shiftwidth=0 softtabstop=0
au filetype java,lua,prolog,python setlocal shiftwidth=4 softtabstop=4

dig \|- 8866
imap <c-e> <c-k>(-
imap <c-l> <c-k>l*
ia \|- ⊢
ia /0 ∅

let b:closetag_html_style = 1
let g:mustache_abbreviations = 1
let g:rustfmt_autosave = 1

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
nnoremap <F8> :TlistToggle<CR>
