vim.cmd('let $FZF_DEFAULT_OPTS="--margin=1,4 --preview \'bat --color=always --style=header,grid --line-range :300 {}\'"')
print('hello from fzf')

-- Ctrl+P opens fzf
vim.keymap.set('n', '<C-p>', ':Files<CR>')

-- Ctrl+F opens Ag (find in files)
vim.keymap.set('n', '<C-f>', ':Ag<CR>')
