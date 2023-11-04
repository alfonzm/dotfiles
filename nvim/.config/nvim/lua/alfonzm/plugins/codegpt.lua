vim.g.codegpt_openai_api_key = 'sk-'

-- keymap <Leader>c will run :Chat command for the current highlighted text in visual mode for the current range
vim.keymap.set('v', '<Leader>c', ":Chat ")
