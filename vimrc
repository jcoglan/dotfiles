autocmd!

set noerrorbells

set nocompatible
set encoding=utf-8
set directory=~/.vim/swap/

set hlsearch incsearch ignorecase smartcase
set pastetoggle=<F2>
set showcmd
set scrolloff=4
set wildmenu

set foldmethod=indent
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
  autocmd!
  autocmd BufRead * normal zR
augroup END

syntax enable
colorscheme peachpuff
set cursorline nowrap number ruler
highlight LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE

filetype plugin indent on
set expandtab shiftwidth=2 softtabstop=2
set autoindent
set backspace=indent,eol,start
set nojoinspaces

autocmd BufNewFile,BufRead *.erb set filetype=html
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead Berksfile,Gemfile,*.gemspec,*.ru set filetype=ruby
autocmd BufNewFile,BufRead *.txt set filetype=text

autocmd FileType markdown,tex,text setlocal formatoptions+=t textwidth=80
autocmd FileType c,cpp,make setlocal noexpandtab shiftwidth=0 softtabstop=0
autocmd FileType java,lua,prolog,python setlocal shiftwidth=4 softtabstop=4

digraphs \|- 8866
iabbrev \|- ⊢
iabbrev /0 ∅
imap <C-e> <C-k>(-
imap <C-l> <C-k>l*

let b:closetag_html_style = 1
let g:mustache_abbreviations = 1
let g:rustfmt_autosave = 1

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
nnoremap <F8> :TlistToggle<CR>

call plug#begin()
  Plug 'ElmCast/elm-vim'
  Plug 'ap/vim-css-color'
  Plug 'brandonbloom/vim-factor'
  Plug 'digitaltoad/vim-jade'
  Plug 'docunext/closetag.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'godlygeek/tabular'
  Plug 'idris-hackers/idris-vim'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'kchmck/vim-coffee-script'
  Plug 'kien/ctrlp.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'rust-lang/rust.vim'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
call plug#end()
