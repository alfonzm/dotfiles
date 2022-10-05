" ------------------------------------------------------------------------------
" # Vim Sets
" ------------------------------------------------------------------------------

" Syntax highlighting
syntax on

" Show line numbers + relative
set number
set relativenumber

" Allow switching of unsaved buffers
set hidden

" No sound on errors
set noerrorbells

" Suggested by coc
set updatetime=300

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

" Highlight current line
:set cursorline

" Utf8 standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" When splitting panes, move cursor to new pane
set splitbelow
set splitright

" # of lines padding when scrolling
set scrolloff=12

" Add marker at column position to prevent long lines of code
set colorcolumn=80
set signcolumn=yes

" Remove vertical split character
set fillchars+=vert:\ 

set t_Co=256

" Enable vimrc for specific projects
" https://akrabat.com/using-vimrc-for-project-specific-settings/
set exrc
set secure

" Enable true colors
set background=dark
set termguicolors

" Enable italics, make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic
set t_ZH=[3m
set t_ZR=[23m
