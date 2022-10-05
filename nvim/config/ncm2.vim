" NCM2
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" enable ncm2 for all buffers
" augroup ncm2
"   au!
"   autocmd BufEnter * call ncm2#enable_for_buffer()
"   au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
"   au User Ncm2PopupClose set completeopt=menuone
" augroup END

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:ncm2#complete_length = [[1,1], [7,2]]
