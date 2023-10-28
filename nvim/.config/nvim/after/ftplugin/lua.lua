-- Love2D
vim.keymap.set('n', '<Leader>l', ':!/Applications/love.app/Contents/MacOS/love .<CR><CR>', { silent = true })

-- Source nvim config
vim.keymap.set('n', '<Leader>S', ':source % | source ~/.config/nvim/init.lua<CR>')
