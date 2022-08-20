" Include options.vim file
source ~/.dotfiles/nvim/options.vim

" Include plugins.vim file
source ~/.dotfiles/nvim/plugins.vim

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

" Required for nerdcommenter
filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Change NERDCommenter leader to comma
let mapleader = ","

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1

" Include keyindings.vim file
source ~/.dotfiles/nvim/keybindings.vim
