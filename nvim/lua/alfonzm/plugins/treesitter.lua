-- Prime
require('nvim-treesitter.configs').setup {
    ensure_installed = { 'php' },
    sync_install = false, -- install asynchronously
    -- ignore_install = {''}, -- parsers to ignore
    highlight = {
        enable = true,
        -- disable = {''}, -- languages to disable
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    playground = { enable = true }
}

-- jessarcher
-- require('nvim-treesitter.configs').setup({
--     highlight = {
--         enable = true,
--         disable = { 'NvimTree' },
--         additional_vim_regex_highlighting = true,
--     },
--     textobjects = {
--         select = {
--             enable = true,
--             lookahead = true,
--             keymaps = {
--                 ["if"] = "@function.inner",
--                 ["af"] = "@function.outer",
--                 ["ic"] = "@class.inner",
--                 ["ac"] = "@class.outer",
--                 ['ia'] = '@parameter.inner',
--                 ['aa'] = '@parameter.outer',
--             },
--         },
--     },
--     context_commentstring = {
--         enable = true,
--     },
-- })
