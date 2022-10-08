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
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'windwp/nvim-autopairs'
  " Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'

  Plug 'moll/vim-bbye'
  " Plug 'christoomey/vim-tmux-navigator'
  " Plug 'APZelos/blamer.nvim'
  " Plug 'junegunn/goyo.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  " Completion
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'ncm2/ncm2'
  " Plug 'roxma/nvim-yarp'
  " Plug 'ncm2/ncm2-path'
  " Plug 'ncm2/ncm2-bufword'

  " PHP
  " Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
  " Plug 'phpactor/ncm2-phpactor'
  " Plug 'stephpy/vim-php-cs-fixer'

  " LSP
  Plug 'neovim/nvim-lspconfig'

  " Treesitter
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

  " Icons
  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'ryanoasis/vim-devicons'

  " Syntax highlighting
  " Plug 'posva/vim-vue'
  " Plug 'pangloss/vim-javascript'
  " Plug 'cakebaker/scss-syntax.vim'
  " Plug 'MaxMEllon/vim-jsx-pretty'
  " Plug 'mattn/emmet-vim'
  " Plug 'plasticboy/vim-markdown'

  " Comments
  Plug 'tpope/vim-commentary'

  " Color schemes
  " Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  " Plug 'eddyekofo94/gruvbox-flat.nvim'
  " Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

  " Color Highlighter
  " Plug 'skammer/vim-css-color'

  " Prettier
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

  " Plug 'StanAngeloff/php.vim'
  " Plug 'StanAngeloff/php.vim', {'for': 'php'}
call plug#end()
