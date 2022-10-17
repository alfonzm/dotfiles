vim.cmd[[let $FZF_DEFAULT_OPTS="--margin=1,4 --preview \'bat --color=always --style=header,grid --line-range :300 {}\'"]]

vim.keymap.set('n', '<C-p>', ':Files<CR>')
vim.keymap.set('n', '<C-f>', ':Ag<CR>')
vim.keymap.set('n', '<Leader>h', ':History<CR>')
