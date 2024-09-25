require('alfonzm.scripts.alternate')

local function map(m, k, v, opts)
    opts = opts or {}
    opts['silent'] = true
    vim.keymap.set(m, k, v, opts)
end

-- Exclude whitespace when doing $
map('v', '$', '$h')

-- Move buffers left/right with Shift+h or Shift+l
-- Ideally, use :Buffers or <Leader>b (see below)
map('n', 'H', ':bp<CR>')
map('n', 'L', ':bn<CR>')

-- When joining lines, dont move cursor position
map('n', 'J', 'mzJ`z')

-- Copy rest of line starting from cursor
map('n', 'Y', 'y$')

-- Keep cursor centered when going next/prev
-- map('n', 'n', 'nzzzv')
-- map('n', 'N', 'Nzzzv')

-- Keep cursor centered when going next/prev
map('n', '<C-d>', '<C-d>z.')
map('n', '<C-u>', '<C-u>z.')

-- -- Keep cursor centered when doing { or }
-- map('n', '{', '{zz')
-- map('n', '}', '}zz')

-- Keep cursor centered when doing [[ or ]]
map('n', '[[', '[[zz')
map('n', ']]', ']]zz')

-- Paste from yank register
-- i.e. after yanking, succeeding d/D's won't overwrite the yank
-- See :h quote0
map('n', '<Leader>p', '\"0p')
map('n', '<Leader>P', '\"0P')
map('v', '<Leader>p', '\"0p')
map('v', '<Leader>P', '\"0P')

-- Pressing <Leader> before any delete motion (d/D)
-- will delete to blackhole register "_ so it doesn't overwrite yank
-- See :h quote_
map('n', '<Leader>d', '\"_d')
map('v', '<Leader>d', '\"_d')

-- Select all
map('n', '<Leader><Leader>', 'ggVG')

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
map('n', '<Leader>Q', ':Bdelete!<CR>')

-- Quick close neovim
map('n', '<Leader>x', ':qa<CR>')
map('n', '<Leader>X', ':qa!<CR>')

-- Open new empty buffer
map('n', '<Leader>n', ':enew<CR>')

-- Close all other buffers except current one
-- %bd! - force delete all buffers
-- <C-o> - reopen latest active buffer
-- bd# - close the [No name] buffer that gets created
-- NvimTreeOpen - reopen NvimTree
-- <C-o> - move to the latest active buffer
map('n', '<Leader>cb', ':%bd!<CR><C-o>:bd#|NvimTreeOpen<CR><C-o>', { desc = 'Close all other buffers except current one' })

-- Close quickfix list
map('n', '<Leader>cq', ':cclose<CR>')

-- PackerCompile shortcut
-- map('n', '<Leader>p', ':PackerCompile<CR>')
-- map('n', '<Leader>pi', ':PackerInstall<CR>')

-- Format JSON
-- map('n', '<Leader>j', ":'<,'>!jq<CR>")
-- map('v', '<Leader>j', ":'<,'>!jq<CR>")

-- Find/replace all instances of visually highlighted text
map('v', '<C-g>', '"hy:%s/<C-r>h//g<left><left>')

-- Interactive find/replace for visually highlighted text
map('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>')

-- Substitute highlighted text on visual mode
map('v', '<Leader>s', ":s//g<left><left>")

-- Add line below
-- nmap <S-Enter> O<Esc>j
-- nmap <CR> o<Esc>k

-- Move up/down quick fix list
-- map('n', '<C-j>', '<cmd>cnext<CR>zz')
-- map('n', '<C-k>', '<cmd>cprev<CR>zz')

-- Clear search highlights
map('n', '<Leader>h', ':nohlsearch<CR>')

-- Map Enter and Backspace to change inside
map('n', '<CR>', 'ciw')
map('n', '<BS>', 'ci')

-- Better indenting - reselect highlighted text after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Paste over currently selected text without yanking it
-- map("v", "p", '"_dp')
-- map("v", "P", '"_dP')

-- Open scratchpad
map('n', '<Leader>s', ':e ~/.alfonz_vim_scratchpad.md<CR>')

-- Leader J sets syntax to JSON and formats the file with jq
map('n', '<Leader>J', ':setf json<CR>:%!jq<CR>', { desc = 'Set syntax=json and format with jq' })

-- Toggle between alternate XXXTest.php and XXX.php files
vim.api.nvim_set_keymap('n', '<Leader>a', [[:lua require('alfonzm.scripts.alternate').toggle_test_file()<CR>]], { noremap = true, silent = true })

-- Motions on single quotes will also apply to backticks
-- vim.api.nvim_set_keymap('n', 'ca\'', 'ca`', { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('n', 'ci\'', 'ci`', { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('n', 'vi\'', 'vi`', { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('n', 'va\'', 'va`', { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('n', 'di\'', 'di`', { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('n', 'da\'', 'da`', { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('n', 'yi\'', 'yi`', { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('n', 'ya\'', 'ya`', { noremap = false, silent = true })

map('n', 'Q', '@qj', { desc = 'Replay macro q and move down' })
map('x', 'Q', ':norm @qj<CR>', { desc = 'Replay macro on selected lines' })
