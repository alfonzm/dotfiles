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
    indicator = { style = 'none' },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    numbers = 'buffer_id',
    separator_style = { "", "" },
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "left", offset = 1 }
    },
  },
}
