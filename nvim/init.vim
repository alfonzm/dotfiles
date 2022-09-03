" Include options.vim file
source ~/.dotfiles/nvim/options.vim

" Include plugins.vim file
source ~/.dotfiles/nvim/plugins.vim

" Gruvbox
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1

" Enable true colors
set background=dark
set termguicolors
colorscheme gruvbox

" Enable italics, make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic
set t_ZH=[3m
set t_ZR=[23m

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

" NERDTree Key bindings
autocmd VimEnter * NERDTree

let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_new_tab = 1

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Toggle NERDTree sidebar with Ctrl+t
nnoremap <C-t> :NERDTreeTabsToggle<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:NERDTreeIgnore = ['^node_modules$', '^vendor$']

" No status line in NERDTree panel
let g:NERDTreeStatusline = '%#NonText#'
let g:NERDTreeMinimalUI = 1

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

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=40

" Enable prettier autoformat on save if config file is present
" https://github.com/prettier/vim-prettier/issues/191#issuecomment-614280489
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

" Required for nerdcommenter
filetype plugin on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Disable markdown folding
let g:vim_markdown_folding_disabled = 0

" Git Gutter
let g:gitgutter_set_sign_backgrounds = 1

" Autorun PHP CS Fixer on save
" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_template = '<committer>, <committer-time> • <summary> <commit-short>'

" gruvbox bg4
highlight Blamer guifg=#7c6f64
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = v:true

" Goyo default width
let g:goyo_width = 100
let g:goyo_linenr = 1

" Include keyindings.vim file
source ~/.dotfiles/nvim/keybindings.vim
