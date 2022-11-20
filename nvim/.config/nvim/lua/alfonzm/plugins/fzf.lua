vim.cmd[[let $FZF_DEFAULT_OPTS="--margin=1,4 --preview \'bat --color=always --style=header,grid --line-range :300 {}\'"]]

-- Don't include filename in rg
vim.cmd[[command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)]]

-- Don't include filename in ag
vim.cmd[[command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)]]

vim.keymap.set('n', '<C-p>', ':GFiles<CR>')
vim.keymap.set('n', '<C-f>', ':Ag<CR>')
vim.keymap.set('n', '<Leader>h', ':History<CR>')
vim.keymap.set('n', '<Leader>l', ':Buffers<CR>')
