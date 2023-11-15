-- required for Browse to work
-- https://vi.stackexchange.com/questions/38447/vim-fugitive-netrw-not-found-define-your-own-browse-to-use-gbrowse
vim.cmd [[command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)]]

vim.keymap.set('n', '<Leader>G', ':GBrowse<CR>')
