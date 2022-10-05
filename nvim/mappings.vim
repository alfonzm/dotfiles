" ------------------------------------------------------------------------------
" # Keymappings
" ------------------------------------------------------------------------------
" This file is automatically included in init.vim by the plugin Sourcery

" Set leader to space
let mapleader = " "

" Move through panes with Ctrl+hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move buffers left/right with Shift+h or Shift+l
" Ideally, use <Leader>l (see below)
nnoremap H :bp<CR>
nnoremap L :bn<CR>

" See buffer list + go to buffer id
nnoremap <Leader>l :ls<CR>:b<space>

" Ctrl+P opens fzf
nnoremap <silent> <C-p> :Files<CR>

" Ctrl+F opens Ag (find in files)
nnoremap <silent> <C-f> :Ag<CR>

" Copy rest of line starting from cursor
nnoremap Y y$

" Keep cursor centered when going next/prev
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep cursor centered when going next/prev
nnoremap <C-d> <C-d>z.
nnoremap <C-u> <C-u>z.

" Keep cursor centered when doing { or }
nnoremap { {zz
nnoremap } }zz

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap < <<c-g>u
inoremap > ><c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u

" Save count + j/k to context for C-o or C-i
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move lines up or down
" ∆ = Alt + j
" ˚ = Alt + k
" https://stackoverflow.com/q/7501092
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Quick save
noremap <Leader>w :update<CR>

" Quick close buffer
nnoremap <Leader>q :Bdelete<CR>

" Source nvim config
nnoremap <Leader>s :source ~/.config/nvim/init.vim<CR>

" Add line below
" nmap <S-Enter> O<Esc>j
" nmap <CR> o<Esc>k
