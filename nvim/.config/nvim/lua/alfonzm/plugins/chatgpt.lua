require('chatgpt').setup({
    popup_window = {
        border = {
            highlight = "Normal:Comment,FloatBorder:Comment"
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
    },
    popup_input = {
        border = {
            highlight = "Normal:Comment,FloatBorder:Comment",
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
    },
})

-- vim.api.nvim_set_keymap('n', '<Leader>C', ':ChatGPT<CR>', { noremap = true, silent = true, desc = 'ChatGPT' })
