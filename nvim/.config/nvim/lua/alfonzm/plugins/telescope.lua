local actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                -- close Telescope in one Esc keypress
                ['<esc>'] = actions.close,
            },
        },
    },
})

vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<C-f>', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<C-g>', ':Telescope git_status<CR>')
vim.keymap.set('n', '<Leader>H', ':Telescope git_file<CR>')
vim.keymap.set('n', '<Leader>b', ':Telescope buffers<CR>')
