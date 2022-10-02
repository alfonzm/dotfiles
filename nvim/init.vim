" ------------------------------------------------------------------------------
" # Vimrc
" ------------------------------------------------------------------------------
" This is the root vimrc config file, symlinked to ~/.config/nvim/init.vim.
" All plugins and config files are sourced by the plugin Vim-Sourcery.
" See: https://github.com/jesseleite/vim-sourcery


" ------------------------------------------------------------------------------
"  # Sourcery
" ------------------------------------------------------------------------------

call plug#begin()
  source ~/.dotfiles/nvim/plugins.vim
call plug#end()

call sourcery#source_path('set.vim')
call sourcery#source_defer('config/indent-blankline.lua')
call sourcery#init()



" TODO: Move to other file, maybe on after dir?
" ------------------------------------------------------------------------------
"  # Highlights
" ------------------------------------------------------------------------------
highlight Blamer guifg=#504945 " Gruvbox bg2

" Custom Statusline
" hi StatusLine guibg=#282828 guifg=#7c6f64
" hi StatusLineNC guibg=#282828 guifg=#504945
" set statusline=%f\ %m
" set fillchars=vert:\ ,stl:\ ,stlnc:\
" set laststatus=2
" set noshowmode

" Removes the 1 cell w different color when using lualine
highlight StatusLine guibg=#282828
highlight StatusLineNC guibg=#282828

" Disable continuing comment when adding newline from comment line
set formatoptions-=cro
