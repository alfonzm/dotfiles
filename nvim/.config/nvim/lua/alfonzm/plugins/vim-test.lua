vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')

vim.g['test#neovim#term_position'] = 'vert'
vim.g['test#php#phpunit#executable'] = 'vendor/bin/phpunit'
-- vim.g['test#strategy'] = 'vimux'
vim.g['test#strategy'] = 'floaterm'

vim.g.VimuxOrientation = 'h'
vim.g.VimuxWidth = '30'
