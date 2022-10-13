local g = vim.g
local o = vim.o

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Syntax highlighting
vim.cmd('syntax on')

-- Set cursor to always be block
o.guicursor = ""

-- Show line numbers + relative
o.nu = true
o.relativenumber = true

-- Allow switching of unsaved buffers
o.hidden = true

-- No sound on errors
o.belloff = 'all'

-- Use spaces instead of tabs
o.expandtab = true

-- 1 tab == 2 spaces
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

-- Better indents
o.autoindent = true
o.smartindent = true

-- Turn backup and swap file off
o.backup = false
o.writebackup = false
o.swapfile = false

-- Enable undofile
o.undodir = '~/.nvim/undodir'
o.undofile = true

-- Smart case insensitive searching
o.smartcase = true
o.ignorecase = true

-- Highlighted + incremental search (jump while typing)
o.incsearch = true
o.hlsearch = false

-- Highlight current line
o.cursorline = true

-- Utf8 standard encoding and en_US as the standard language
o.encoding = 'utf-8'

-- Use Unix as the standard file type
-- o.ffs = 'unix,dos,mac'

-- When splitting panes, move cursor to new pane
o.splitbelow = true
o.splitright = true

-- # of lines padding when scrolling
o.scrolloff = 12

-- Add marker at column position to prevent long lines of code
o.colorcolumn = 80
o.signcolumn = 'yes'

-- Remove vertical split character
vim.opt.fillchars = {
  vert = " "
}

-- Set 256 color
o.t_Co = 256

-- Enable vimrc for specific projects
-- https://akrabat.com/using-vimrc-for-project-specific-settings/
o.exrc = true
o.secure = true

-- Enable true colors
o.background = 'dark'
o.termguicolors = true

-- Enable italics, make sure this is immediately after colorscheme
-- https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic

-- highlight
-- highlight Comment cterm = italic gui = italic

o.t_ZH = '[3m'
o.t_ZR = '[23m'

-- Disable continuation of comment on next line
vim.cmd[[autocmd BufWinEnter,BufNewFile * setlocal formatoptions-=cro]]

-- Sync system and vim clipboard
o.clipboard = "unnamedplus"

-- Read file updates automatically, can undo with u
o.autoread = true

-- Highlight yanked selection for 60ms
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=60}]]
