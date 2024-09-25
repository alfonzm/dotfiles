require("oil").setup({
    buf_options = {
        buflisted = false,
    },
    view_options = {
        show_hidden = true,
    },
    skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil: Open parent directory" })
