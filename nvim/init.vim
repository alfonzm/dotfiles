" ------------------------------------------------------------------------------
" # Vimrc
" ------------------------------------------------------------------------------
" This is the root vimrc config file, symlinked to ~/.config/nvim/init.vim.
" All plugins and config files are sourced by the plugin Vim-Sourcery.
" See: https://github.com/jesseleite/vim-sourcery


" ------------------------------------------------------------------------------
" # Sourcery
" ------------------------------------------------------------------------------

call plug#begin()
  source ~/.dotfiles/nvim/plugins.vim
call plug#end()

call sourcery#source_path('set.vim')

call sourcery#init()
