require('lualine').setup({
    options = {
        theme = 'gruvbox',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { 'vim-plug', 'NvimTree' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            { 'filename', file_status = false, path = 1 },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {
            { 'filename', file_status = false, path = 1 },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
})
