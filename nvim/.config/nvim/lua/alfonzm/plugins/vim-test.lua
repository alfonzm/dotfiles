vim.keymap.set('n', '<Leader>tn', ':TestNearest --verbose<CR>')
vim.keymap.set('n', '<Leader>tf', ':TestFile --verbose<CR>')
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', ':TestLast --verbose<CR>')
vim.keymap.set('n', '<Leader>tv', ':TestVisit --verbose<CR>')

vim.g['test#neovim#term_position'] = 'vert'
vim.g['test#php#phpunit#executable'] = 'vendor/bin/phpunit'
vim.g['test#strategy'] = 'neovim'
