require('nvim-treesitter.configs').setup {
    sync_install = false, -- install asynchronously
    ensure_installed = {
        'php',
        'tsx',
        'json',
        'javascript',
        'typescript',
        'html',
        'css',
        'lua',
        'yaml',
    },
    highlight = {
        enable = true,
        disable = { 'NvimTree', 'php' },
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true
    },
    playground = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["if"] = "@function.inner",
                ["af"] = "@function.outer",
                ['ia'] = '@parameter.inner',
                ['aa'] = '@parameter.outer',
                ["ic"] = "@class.inner",
                ["ac"] = "@class.outer",
            },
        },
    },
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
