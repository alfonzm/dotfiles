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

call plug#begin()
  " Utilities
  Plug 'vim-utils/vim-man'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'preservim/nerdcommenter'
  Plug 'airblade/vim-gitgutter'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'itchyny/lightline.vim'

  " NERDTree
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'

  " Syntax highlighting
  " Plug 'posva/vim-vue'
  Plug 'pangloss/vim-javascript'
  " Plug 'cakebaker/scss-syntax.vim'
  " Plug 'tpope/vim-commentary'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'mattn/emmet-vim'
  Plug 'plasticboy/vim-markdown'

  " Color schemes
  Plug 'morhetz/gruvbox'

  " Prettier
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

" Gruvbox
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1

" Enable true colors
set background=dark
set termguicolors
colorscheme gruvbox

" Lightline Theme
let g:lightline = {}
let g:lightline.colorscheme = 'seoul256'

" Enable italics, make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic
set t_ZH=[3m
set t_ZR=[23m

" NERDTree Key bindings
autocmd VimEnter * NERDTree

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Toggle NERDTree sidebar with Ctrl+t
nnoremap <C-t> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:NERDTreeIgnore = ['^node_modules$', '^vendor$']

" Enable prettier autoformat on save if config file is present
" https://github.com/prettier/vim-prettier/issues/191#issuecomment-614280489
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

" Move through panes with Ctrl+hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shift tabs left/right with Shift+h or Shift+l
nnoremap H gT
nnoremap L gt

" Ctrl+P opens fzf
nnoremap <silent> <C-p> :FZF<CR>

" Copy rest of line starting from cursor
nnoremap Y y$

" Keep cursor centered when going next/prev
nnoremap n nzzzv
nnoremap N Nzzzv

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap < <<c-g>u
inoremap > ><c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u

" Save count + j/k to context for C-o or C-i
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move lines up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Required for nerdcommenter
filetype plugin on

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1
