require('bufferline').setup {
    highlights = {
        background = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'LineNr' },
        },
        fill = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'EndOfBuffer' },
        },
        offset_separator = {
            fg = { attribute = 'fg', highlight = 'EndOfBuffer' },
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
        },
        numbers = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'EndOfBuffer' },
        },
        numbers_visible = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'EndOfBuffer' },
        },
        numbers_selected = {
            italic = false
        },
        duplicate = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'EndOfBuffer' },
            italic = false,
        },
        duplicate_selected = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'Normal' },
            italic = false,
        },
        duplicate_visible = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'EndOfBuffer' },
            italic = false,
        },
        indicator_visible = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'EndOfBuffer' },
        },
        buffer_visible = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
            fg = { attribute = 'fg', highlight = 'LineNr' },
        },
        buffer_selected = {
            italic = false,
        },
        modified = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
        },
        modified_visible = {
            bg = { attribute = 'bg', highlight = 'EndOfBuffer' },
        },
    },
    options = {
        truncate_names = false,
        indicator = { style = 'none' },
        show_buffer_icons = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        numbers = 'buffer_id',
        separator_style = { "", "" },
        offsets = {
            {
                highlight = "Normal",
                filetype   = "NvimTree",
                text       = "",
                text_align = "left",
                offset     = 0,
            }
        },
    },
}
