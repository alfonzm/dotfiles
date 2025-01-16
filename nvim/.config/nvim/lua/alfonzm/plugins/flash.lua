require("flash").setup({
    modes = {
        char = {
            -- jump_labels = true,
            highlight = { backdrop = false }
        },
    }
})

-- vim.api.nvim_set_keymap('n', '<Leader>lt', [[:lua require('flash').treesitter()<CR>]], { noremap = true, silent = true })
