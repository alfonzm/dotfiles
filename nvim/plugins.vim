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
  Plug 'jesseleite/vim-sourcery'
  Plug 'vim-utils/vim-man'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'preservim/nerdcommenter'
  " Plug 'airblade/vim-gitgutter'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'stephpy/vim-php-cs-fixer'
  Plug 'moll/vim-bbye'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'APZelos/blamer.nvim'
  Plug 'junegunn/goyo.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  " LSP
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " lightline
  " Plug 'itchyny/lightline.vim'
  " Plug 'shinchu/lightline-gruvbox.vim'

  " Bufferline
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

  " Vim Sourcery
  Plug 'jesseleite/vim-sourcery'

  " File Explorer tab
  Plug 'kyazdani42/nvim-tree.lua'
  " Plug 'preservim/nerdtree'
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
  Plug 'sainnhe/gruvbox-material'
  Plug 'eddyekofo94/gruvbox-flat.nvim'
  Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

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
let g:gruvbox_invert_selection=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1
" colorscheme gruvbox

" Gruvbox flat
" colorscheme gruvbox-flat

" Gruvbox material
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_foreground = 'original'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

" GitGutter
let g:gitgutter_override_sign_column_highlight = 1
highlight clear SignColumn
hi GitGutterAdd          ctermbg=235
hi GitGutterChange       ctermbg=235
hi GitGutterDelete       ctermbg=235
hi GitGutterChangeDelete ctermbg=235
set updatetime=250

" Lightline Theme
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

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
let g:vim_markdown_folding_disabled = 1

" Autorun PHP CS Fixer on save
" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '<committer>, <committer-time> • <summary> <commit-short>'
highlight Blamer guifg=#7c6f64 " Gruvbox bg4

" Goyo
let g:goyo_width = 100
let g:goyo_linenr = 1

" Indent Blankline
highlight IndentBlanklineChar guifg=#363636
