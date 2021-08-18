autocmd!

" misc
set nocompatible
set encoding=utf-8

" swap file management
set directory=~/.vim/swap/
set updatetime=400

" interface elements
set noerrorbells
set cursorline
set number
set scrolloff=4
set ruler
set showcmd
set wildmenu

" syntax highlighting
filetype plugin indent on
syntax enable
set background=dark
colorscheme peachpuff

" search behaviour
set hlsearch
set incsearch
set ignorecase
set smartcase
highlight Search ctermfg=Black

" whitespace
set autoindent
set backspace=indent,eol,start
set expandtab
set shiftwidth=2
set softtabstop=2
set nojoinspaces
set nowrap

" fold based on indents, and unfold everything on loading files
set foldmethod=indent
autocmd BufRead * normal zR
highlight Folded ctermbg=Black

" set filetypes based on file extensions
autocmd BufNewFile,BufRead *.erb set filetype=html
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead Berksfile,Brewfile,Gemfile,*.gemspec,*.ru set filetype=ruby
autocmd BufNewFile,BufRead *.txt set filetype=text

" filetype-dependent options
autocmd FileType markdown,tex,text setlocal formatoptions+=t textwidth=80
autocmd FileType c,cpp,make setlocal noexpandtab shiftwidth=0 softtabstop=0
autocmd FileType java,prolog,python setlocal shiftwidth=4 softtabstop=4

" abbreviations
"   |-      ⊢
"   0/      ∅
"   <C-e>   ∈
"   <C-l>   λ
digraphs \|- 8866
inoreabbrev \|- ⊢
inoreabbrev 0/ ∅
inoremap <C-e> <C-k>(-
inoremap <C-l> <C-k>l*

" mappings
set pastetoggle=<F2>

" settings: ctags
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
nnoremap <F8> :TlistToggle<CR>

" settings: gitgutter
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd ctermfg=DarkGreen
highlight GitGutterChange ctermfg=DarkBlue
highlight GitGutterDelete ctermfg=DarkRed
highlight SignColumn ctermbg=NONE

" settings: other plugins
let b:closetag_html_style = 1
let g:mustache_abbreviations = 1
let g:rustfmt_autosave = 1

call plug#begin()
  Plug 'ElmCast/elm-vim'
  Plug 'airblade/vim-gitgutter'
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
