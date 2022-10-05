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
  Plug 'junegunn/fzf.vim'
  " Plug 'preservim/nerdcommenter'
  " Plug 'airblade/vim-gitgutter'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'

  Plug 'moll/vim-bbye'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'APZelos/blamer.nvim'
  Plug 'junegunn/goyo.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  " Completion
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  " Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-bufword'

  " PHP
  Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
  Plug 'phpactor/ncm2-phpactor'
  Plug 'stephpy/vim-php-cs-fixer'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Status Line
  Plug 'nvim-lualine/lualine.nvim'
  " Plug 'itchyny/lightline.vim'
  " Plug 'shinchu/lightline-gruvbox.vim'

  " Bufferline
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

  " Vim Sourcery
  Plug 'jesseleite/vim-sourcery'

  " File Tree
  Plug 'kyazdani42/nvim-tree.lua'
  " Plug 'preservim/nerdtree'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'Xuyuanp/nerdtree-git-plugin'
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

  " Color schemes
  " Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  " Plug 'eddyekofo94/gruvbox-flat.nvim'
  " Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

  " Prettier
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

  " Plug 'StanAngeloff/php.vim'
  Plug 'StanAngeloff/php.vim', {'for': 'php'}
call plug#end()


" ------------------------------------------------------------------------------
" # Plugins Config
" ------------------------------------------------------------------------------

" Gruvbox
" let g:gruvbox_invert_selection=1
" let g:gruvbox_contrast_dark='medium'
" let g:gruvbox_italic=1
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
" let g:user_emmet_leader_key=''
" let g:user_emmet_expandabbr_key=''
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Vim Markdown
let g:vim_markdown_folding_disabled = 1

" Autorun PHP CS Fixer on save
" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" Goyo
let g:goyo_width = 100
let g:goyo_linenr = 1

" StanAngeloff/PHP
let g:php_var_selector_is_identifier=1
