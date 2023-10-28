vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1

vim.fn.sign_define('DiagnosticSignError', { text = '•', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '•', texthl = 'yellow', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignHint', { text = '•', texthl = 'yellow', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '•', texthl = 'yellow', linehl = '', numhl = '' })

-- Set nvim-tree bg color to be Normal
-- This is the only solution that works so far
vim.api.nvim_exec(
[[
augroup CustomNvimTreeColors
autocmd!
autocmd BufEnter * hi NvimTreeNormal guifg=NONE guibg=NONE
autocmd BufEnter * hi NvimTreeEndOfBuffer guifg=NONE guibg=NONE
autocmd BufEnter * hi NvimTreeOpenedFile guifg=NONE guibg=#504945
autocmd BufEnter * hi NvimTreeCursorLine guifg=NONE guibg=#32302f
augroup END
]], false)

vim.api.nvim_exec(
    [[
    let g:gruvbox_material_diagnostic_text_highlight = 1
    let g:gruvbox_material_diagnostic_line_highlight = 1
    let g:gruvbox_material_diagnostic_virtual_text   = 1
]], false)

-- Color scheme
vim.cmd [[ colorscheme gruvbox-material ]]
-- vim.cmd('colorscheme gruvbox')

-- Custom highlights
vim.cmd [[highlight IndentBlanklineChar guifg=#333333]]
vim.cmd [[highlight Blamer guifg=#504945]] -- Gruvbox bg2

-- Change search hit/yanked selection
vim.cmd [[highlight IncSearch guifg=#282828 guibg=#fabd2f]]

-- Removes 1 cell to the left of lualine
vim.cmd [[highlight StatusLine guibg=#282828]]
vim.cmd [[highlight StatusLineNC guibg=#282828]]
