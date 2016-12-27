set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

syntax enable
set background=dark
set expandtab
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set list
set hlsearch
set nowrap
set foldenable
set guifont=Monaco:h12

" set relative line numbers
"set rnu

" visual mode: don't deselect text when identing
vnoremap > >gv
vnoremap < <gv

let g:jsx_ext_required = 0 " allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
let mapleader = "\<Space>"

" config for 'kien/ctrlp.vim'
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_show_hidden = 1

" ignores entries specified in .gitignore.
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others | grep -v "^\..*$"'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .']
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

" leader y as yank to OS clipboard
vmap <leader>y "+y

" leader leader as :nohlsearch
map <leader><space> :nohlsearch<CR>

" set leader w as :w
noremap <leader>w :w<CR>

" set leader q as :q
noremap <leader>q :q<CR>

" reload vim
map <silent> <leader>r :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" set mapping to navigate between open split windows
noremap <C-J> <C-W>j<C-W>_
noremap <C-k> <C-W>k<C-W>_
noremap <C-h> <C-W>h<C-W>_
noremap <C-l> <C-W>l<C-W>_

map <F3> :NERDTreeFind<CR>

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-sensible'
Plugin 'ervandew/supertab'
Plugin 'sheerun/vim-polyglot'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
Plugin 'plasticboy/vim-markdown'
Plugin 'ap/vim-css-color'
Plugin 'mxw/vim-jsx'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-endwise'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-projectionist'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'crusoexia/vim-monokai'

map <F2> :NERDTreeToggle<CR>

call vundle#end()
filetype plugin indent on

" nerdtree"
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" column 80 indication"
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="80".join(range(120,999),",")
let &colorcolumn="80"
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"
let g:ag_highlight=1

if executable('ag')
  " note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

ca ag Ag!

" set monokai colorscheme
syntax on
set background=dark
colorscheme monokai

hi Search ctermbg=118
hi Search guibg=#A6E22E
