vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1

vim.fn.sign_define("DiagnosticSignError", { text = '•', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define("DiagnosticSignWarn", { text = '•', texthl = 'yellow', linehl = '', numhl = '' })
vim.fn.sign_define("DiagnosticSignHint", { text = '•', texthl = 'yellow', linehl = '', numhl = '' })
vim.fn.sign_define("DiagnosticSignInfo", { text = '•', texthl = 'yellow', linehl = '', numhl = '' })

vim.api.nvim_exec(
    [[
    augroup-theme-overrides
        autocmd!
        autocmd ColorScheme gruvbox-material highlight Folded ctermfg=LightGray guifg=#918d88
        autocmd ColorScheme gruvbox-material highlight Folded ctermbg=235 guibg=NONE
        autocmd ColorScheme gruvbox-material highlight Folded cterm=italic gui=italic
        autocmd ColorScheme gruvbox-material highlight SignColumn ctermbg=NONE guibg=NONE
        autocmd ColorScheme gruvbox-material highlight DiagnosticSign ctermbg=235 guibg=NONE

        " NvimTree
        autocmd ColorScheme gruvbox-material highlight NvimTreeNormal guifg=Normal guibg=NONE
        autocmd ColorScheme gruvbox-material highlight NvimTreeEndOfBuffer guifg=#7c6f64 guibg=NONE
        " autocmd ColorScheme gruvbox-material highlight NvimTreeFolderName guifg=#7c6f64
        " autocmd ColorScheme gruvbox-material highlight NvimTreeOpenedFolderName guifg=#ebdbb2
        " autocmd ColorScheme gruvbox-material highlight NvimTreeEmptyFolderName guifg=#ebdbb2
        autocmd ColorScheme gruvbox-material highlight NvimTreeOpenedFile guifg=#ebdbb2
    augroup END
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

-- Change NvimTree folder colors, not yet working (TODO)
vim.cmd [[highlight NvimTreeNormal guifg=Normal guibg=NONE]]
vim.cmd [[highlight NvimTreeEndOfBuffer guifg=#7c6f64 guibg=NONE]]
-- vim.cmd [[highlight NvimTreeOpenedFolderName guifg=#7c6f64]]
-- vim.cmd [[highlight NvimTreeEmptyFolderName guifg=#7c6f64]]
