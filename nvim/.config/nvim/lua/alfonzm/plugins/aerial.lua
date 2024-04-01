local function is_aerial_open()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buftype = vim.api.nvim_buf_get_option(buf, "filetype")
        if buftype == "aerial" then
            return true
        end
    end
    return false
end

vim.keymap.set("n", "{", function()
    if is_aerial_open() then
        vim.cmd("AerialPrev")
    else
        -- Simulate pressing `{` in normal mode
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("{", true, false, true), "n", false)
    end
end, {silent = true, noremap = true})

vim.keymap.set("n", "}", function()
    if is_aerial_open() then
        vim.cmd("AerialNext")
    else
        -- Simulate pressing `}` in normal mode
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("}", true, false, true), "n", false)
    end
end, {silent = true, noremap = true})

-- Your existing setup for Aerial
require("aerial").setup({
    backends = { "treesitter", "lsp" },
    -- filter_kind = false,
})
vim.keymap.set("n", "<leader>A", "<cmd>AerialToggle<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "aerial",
  callback = function()
    vim.opt_local.fillchars = { fold = " ", eob = " " }
  end,
})
