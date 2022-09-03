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
  Plug 'jistr/vim-nerdtree-tabs'

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

lua << EOF
require("bufferline").setup{}
EOF
