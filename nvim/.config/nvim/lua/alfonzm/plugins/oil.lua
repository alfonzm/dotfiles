require("oil").setup({
    buf_options = {
        buflisted = true,
    },
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil: Open parent directory" })
