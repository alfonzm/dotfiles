local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Move through panes with Ctrl+hjkl
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('v', '<C-h>', '<C-w>h')
map('v', '<C-j>', '<C-w>j')
map('v', '<C-k>', '<C-w>k')
map('v', '<C-l>', '<C-w>l')

-- Exclude whitespace when doing $
map('v', '$', '$h')

-- Move buffers left/right with Shift+h or Shift+l
-- Ideally, use <Leader>l (see below)
map('n', 'H', ':bp<CR>')
map('n', 'L', ':bn<CR>')

-- See buffer list + go to buffer id
map('n', '<Leader>l', ':ls<CR>:b<space>')

-- When joining lines, dont move cursor position
map('n', 'J', 'mzJ`z')

-- Copy rest of line starting from cursor
map('n', 'Y', 'y$')

-- Keep cursor centered when going next/prev
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep cursor centered when going next/prev
map('n', '<C-d>', '<C-d>z.')
map('n', '<C-u>', '<C-u>z.')

-- Keep cursor centered when doing { or }
map('n', '{', '{zz')
map('n', '}', '}zz')

-- Paste/Yank without overriding register
map('x', '<Leader>p', '_dP')
map('n', '<leader>y', '\"+y')
map('v', '<leader>y', '\"+y')
map('n', '<leader>Y', '\"+Y')
map('n', '<leader>d', '\"_d')
map('v', '<leader>d', '\"_d')
map('v', '<leader>d', '\"_d')

-- Indent right away after pasting
map('n', 'p', 'p==')

-- Undo breakpoints
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')
map('i', '<', '<<c-g>u')
map('i', '>', '><c-g>u')
map('i', '(', '(<c-g>u')
map('i', ')', ')<c-g>u')

-- Save count + j/k to context for C-o or C-i
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

-- Move lines up or down
-- ∆ = Alt + j
-- ˚ = Alt + k
-- https://stackoverflow.com/q/7501092
map('n', '∆', ':move .+1<CR>==')
map('n', '˚', ':move .-2<CR>==')
map('i', '∆', '<Esc>:move .+1<CR>==gi')
map('i', '˚', '<Esc>:move .-2<CR>==gi')
map('v', '∆', ":move '>+1<CR>gv=gv")
map('v', '˚', ":move '<-2<CR>gv=gv")

-- Quick save
map('n', '<Leader>w', ':update<CR>')

-- Quick close buffer
map('n', '<Leader>q', ':Bdelete<CR>')

-- Quick close window
map('n', '<Leader>Q', ':q<CR>')

-- Source nvim config
map('n', '<Leader>s', ':source ~/.config/nvim/init.lua<CR>')

-- PackerCompile shortcut
-- map('n', '<Leader>p', ':PackerCompile<CR>')
map('n', '<Leader>pi', ':PackerInstall<CR>')

-- Add line below
-- nmap <S-Enter> O<Esc>j
-- nmap <CR> o<Esc>k

-- Move up/down quick fix list
-- map('n', '<C-j>', '<cmd>cnext<CR>zz')
-- map('n', '<C-k>', '<cmd>cprev<CR>zz')