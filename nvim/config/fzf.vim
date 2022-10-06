let $FZF_DEFAULT_OPTS="--margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" Ctrl+P opens fzf
nnoremap <silent> <C-p> :Files<CR>

" Ctrl+F opens Ag (find in files)
nnoremap <silent> <C-f> :Ag<CR>
