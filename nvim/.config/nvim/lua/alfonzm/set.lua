-- Possible options to improve Vim + tmux performance
vim.opt.cursorline = false
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.showmatch = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.cursorcolumn = false

-- No BG for NonText
vim.cmd[[hi NonText cterm=NONE ctermfg=NONE]]

-- Map <leader> to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Syntax highlighting
vim.cmd[[syntax on]]

-- Single global status line
vim.o.laststatus = 3

-- Set cursor to always be block
vim.o.guicursor = ""

-- Show line numbers + relative
vim.o.nu = true
vim.o.relativenumber = true

-- Allow switching of unsaved buffers
vim.o.hidden = true

-- No sound on errors
vim.o.belloff = 'all'

-- Use spaces instead of tabs
vim.o.expandtab = true

-- 1 tab == 2 spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Better indents
vim.o.autoindent = true
vim.o.smartindent = true

-- Turn backup and swap file off
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Enable undofile
vim.o.undodir = '/Users/alfonzm/.nvim/undodir'
vim.o.undofile = true

-- Smart case insensitive searching
vim.o.smartcase = true
vim.o.ignorecase = true

-- Disable highlight of search results
vim.o.hlsearch = false

-- Incremental search (jump while typing)
vim.o.incsearch = true

-- Highlight current line
vim.o.cursorline = true

-- Utf8 standard encoding and en_US as the standard language
vim.o.encoding = 'utf-8'

-- Use Unix as the standard file type
-- vim.o.ffs = 'unix,dos,mac'

-- When splitting panes, move cursor to new pane
vim.o.splitbelow = true
vim.o.splitright = true

-- # of lines padding when scrolling
vim.o.scrolloff = 12

-- Add marker at column position to prevent long lines of code
vim.o.colorcolumn = 80
vim.o.signcolumn = 'yes'

-- Remove vertical split character
vim.opt.fillchars = {
    vert = " ",
    vertright = " ",
    vertleft = " ",
    verthoriz = "─",
    horizdown = "─",
    horizup = "─",
}

-- Set 256 color
vim.o.t_Co = 256

-- Enable vimrc for specific projects
-- https://akrabat.com/using-vimrc-for-project-specific-settings/
vim.o.exrc = true
vim.o.secure = true

-- Enable true colors
vim.o.background = 'dark'
vim.o.termguicolors = true

-- Enable italics, make sure this is immediately after colorscheme
-- https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic

-- highlight
-- highlight Comment cterm = italic gui = italic

vim.o.t_ZH = '[3m'
vim.o.t_ZR = '[23m'

-- Disable continuation of comment on next line
vim.cmd[[autocmd BufWinEnter,BufNewFile * setlocal formatoptions-=cro]]

-- Sync system and vim clipboard
vim.o.clipboard = "unnamedplus"

-- Read file updates automatically, can undo with u
vim.o.autoread = true

-- Highlight yanked selection for 60ms
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=100}]]

-- Disable fold
vim.o.foldenable = false
