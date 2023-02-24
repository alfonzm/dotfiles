vim.keymap.set('n', '<Leader>g', ':FloatermNew --width=0.9 --height=0.9 lazygit<CR>')
vim.keymap.set('n', '<Leader>k', ':FloatermNew lazydocker<CR>')
vim.keymap.set('n', '<Leader>a', ':FloatermNew php artisan tinker<CR>')
vim.keymap.set('n', '<Leader>f', ':FloatermToggle<CR>')
vim.keymap.set('t', '<C-c>', '<C-\\><C-n>:FloatermToggle<CR>')

vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
