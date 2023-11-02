require("flash").setup({})

vim.api.nvim_set_keymap('n', '<Leader>lt', [[:lua require('flash').treesitter()<CR>]], { noremap = true, silent = true })
