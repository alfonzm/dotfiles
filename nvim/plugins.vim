" Install vim-plug if it is not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ------------------------------------------------------------------------------
" # Plugins
" ------------------------------------------------------------------------------

call plug#begin()
  " Utilities
  Plug 'vim-utils/vim-man'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'preservim/nerdcommenter'
  Plug 'airblade/vim-gitgutter'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'stephpy/vim-php-cs-fixer'
  Plug 'moll/vim-bbye'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'APZelos/blamer.nvim'
  Plug 'junegunn/goyo.vim'

  " lightline
  " Plug 'itchyny/lightline.vim'
  " Plug 'shinchu/lightline-gruvbox.vim'

  " Bufferline
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

  " Vim Sourcery
  Plug 'jesseleite/vim-sourcery'

  " NERDTree
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Plug 'jistr/vim-nerdtree-tabs'

  " Icons
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'

  " Syntax highlighting
  " Plug 'posva/vim-vue'
  Plug 'pangloss/vim-javascript'
  " Plug 'cakebaker/scss-syntax.vim'
  Plug 'tpope/vim-commentary'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'mattn/emmet-vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'StanAngeloff/php.vim'

  " Color schemes
  Plug 'morhetz/gruvbox'

  " Prettier
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()


" ------------------------------------------------------------------------------
" # Plugins Config
" ------------------------------------------------------------------------------

" Gruvbox
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1
colorscheme gruvbox

" Bufferline
lua << EOF
require("bufferline").setup{}
EOF

" GitGutter
let g:gitgutter_override_sign_column_highlight = 1
highlight clear SignColumn
hi GitGutterAdd          ctermbg=235
hi GitGutterChange       ctermbg=235
hi GitGutterDelete       ctermbg=235
hi GitGutterChangeDelete ctermbg=235
set updatetime=250

" let g:gitgutter_set_sign_backgrounds = 1

" Lightline Theme
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

" NERDTreeTabs
" let g:nerdtree_tabs_open_on_new_tab = 1
" let g:nerdtree_tabs_open_on_gui_startup = 1
" let g:nerdtree_tabs_focus_on_files = 1
" let g:nerdtree_tabs_open_on_new_tab = 1
" nnoremap <C-t> :NERDTreeTabsToggle<CR>

" NERDTree
autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$', '^vendor$']
let g:NERDTreeStatusline = '%#NonText#'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=40

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  :'✹',
      \ 'Staged'    :'✚',
      \ 'Untracked' :'✭',
      \ 'Renamed'   :'➜',
      \ 'Unmerged'  :'═',
      \ 'Deleted'   :'✖',
      \ 'Dirty'     :'~',
      \ 'Ignored'   :'☒',
      \ 'Clean'     :'✔︎',
      \ 'Unknown'   :'?',
      \ }

" Prettier
" Enable autoformat on save if config file is present
" https://github.com/prettier/vim-prettier/issues/191#issuecomment-614280489
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

" NERDCommenter
filetype plugin on
let g:NERDSpaceDelims = 1

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Vim Markdown
let g:vim_markdown_folding_disabled = 0

" Autorun PHP CS Fixer on save
" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '<committer>, <committer-time> • <summary> <commit-short>'
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = v:true
highlight Blamer guifg=#7c6f64 " Gruvbox bg4

" Goyo
let g:goyo_width = 100
let g:goyo_linenr = 1
