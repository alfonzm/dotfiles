" Syntax highlighting
syntax on

" Show line numbers + relative
set number
set relativenumber

" No sound on errors
set noerrorbells

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set tabstop=2 softtabstop=2
set shiftwidth=2

" Better indents
set autoindent
set smartindent

" Turn backup and swap file off
set nobackup
set nowritebackup
set noswapfile

" Enable undofile
set undodir=~/.nvim/undodir
set undofile

" Smart case insensitive searching
set smartcase
set ignorecase

" Highlighted + incremental search (jump while typing)
set incsearch
set nohlsearch

" Utf8 standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" When splitting panes, move cursor to new pane
set splitbelow
set splitright

" # of lines padding when scrolling
set scrolloff=8

" Add marker at column position to prevent long lines of code
set colorcolumn=80
set signcolumn=yes

set t_Co=256
