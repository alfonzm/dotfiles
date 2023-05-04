vim.keymap.set('n', '<Leader>g', ':FloatermNew --wintype=float --width=0.9 --height=0.9 --position=center lazygit<CR>')
vim.keymap.set('n', '<Leader>k', ':FloatermNew --wintype=float --width=0.9 --height=0.9 --position=center lazydocker<CR>')
vim.keymap.set('n', '<Leader>T', ':FloatermToggle terminal<CR>')
-- vim.keymap.set('n', '<Leader>a', ':FloatermNew php artisan tinker<CR>')
-- vim.keymap.set('n', '<Leader>f', ':FloatermToggle<CR>')
vim.keymap.set('t', '<C-d>', '<C-\\><C-n>:FloatermToggle<CR>')

vim.g.floaterm_title = ""

-- VSplit right side
vim.g.floaterm_wintype = 'vsplit'
vim.g.floaterm_width = 0.3
vim.g.floaterm_position = "right"

-- Float right side
-- vim.g.floaterm_width = 0.4
-- vim.g.floaterm_height = 0.9
-- vim.g.floaterm_position = "right"


vim.cmd('autocmd FileType floaterm setlocal nonumber norelativenumber')

vim.cmd [[
  augroup FloatermConfig
    autocmd!
    autocmd TermOpen floaterm setlocal nonumber
  augroup END
]]
