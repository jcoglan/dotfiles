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
colorscheme desert

highlight LineNr ctermfg=Blue
" highlight Search ctermfg=Black
" highlight Folded ctermbg=Black
highlight GitGutterAdd ctermfg=LightGreen
highlight GitGutterChange ctermfg=LightBlue
highlight GitGutterDelete ctermfg=LightRed
" highlight SignColumn ctermbg=NONE

" search behaviour
set hlsearch
set incsearch
set ignorecase
set smartcase

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
autocmd BufEnter * normal zR

" set filetypes based on file extensions
autocmd BufEnter *.erb set filetype=html
autocmd BufEnter *.md set filetype=markdown
autocmd BufEnter Berksfile,Brewfile,Gemfile,*.gemspec,*.ru set filetype=ruby
autocmd BufEnter *.txt set filetype=text

" filetype-dependent options
" tw = textwidth, sw = shiftwidth, sts = softtabstop
autocmd FileType markdown,rst,tex,text setlocal sw=2 sts=2 formatoptions+=t tw=80
autocmd FileType c,cpp,make setlocal noexpandtab sw=0 sts=0
autocmd FileType erlang,java,prolog,python setlocal sw=4 sts=4

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

" settings: other plugins
let b:closetag_html_style = 1
let g:mustache_abbreviations = 1
let g:rustfmt_autosave = 1

function ParentDirectories()
  let l:home = expand('~')
  let l:dir = getcwd()
  let l:dirs = []

  while l:dir != l:home
    call add(l:dirs, l:dir)
    let l:dir = fnamemodify(l:dir, ':h')
  endwhile

  return l:dirs
endfunction

function LoadIfPresent(file)
  if filereadable(a:file)
    execute 'source' a:file
  endif
endfunction

for s:dir in ParentDirectories()
  let s:relative = fnamemodify(s:dir, ':~')[2:]
  call LoadIfPresent(s:dir . '/.vimrc')
  call LoadIfPresent(expand('~/.vim/config/' . s:relative . '.vim'))
endfor

call plug#begin()
  Plug 'ElmCast/elm-vim'
  Plug 'airblade/vim-gitgutter', { 'branch': 'main' }
  Plug 'ap/vim-css-color'
  Plug 'brandonbloom/vim-factor'
  Plug 'digitaltoad/vim-jade'
  Plug 'docunext/closetag.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'gleam-lang/gleam.vim', { 'branch': 'main' }
  Plug 'godlygeek/tabular'
  Plug 'idris-hackers/idris-vim'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'kchmck/vim-coffee-script'
  Plug 'kien/ctrlp.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'prettier/vim-prettier'
  Plug 'rust-lang/rust.vim'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-erlang/vim-erlang-runtime'
  Plug 'watzon/vim-edge-template'
call plug#end()
