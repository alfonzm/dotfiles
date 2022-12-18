vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1

vim.fn.sign_define("DiagnosticSignError", { text = '•', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define("DiagnosticSignWarn", { text = '•', texthl = 'yellow', linehl = '', numhl = '' })
vim.fn.sign_define("DiagnosticSignHint", { text = '•', texthl = 'yellow', linehl = '', numhl = '' })
vim.fn.sign_define("DiagnosticSignInfo", { text = '•', texthl = 'yellow', linehl = '', numhl = '' })

-- Temporary fix for Nvim-Tree bg color
vim.api.nvim_exec(
[[
augroup MyColors
autocmd!
autocmd BufNewFile,BufRead * hi NvimTreeNormal guifg=NONE guibg=NONE
augroup END
]], false)

vim.api.nvim_exec(
    [[
    " augroup MyColors
    "     autocmd!
    "     autocmd ColorScheme * highlight Folded ctermfg=LightGray guifg=#918d88
    "     autocmd ColorScheme * highlight Folded ctermbg=235 guibg=NONE
    "     autocmd ColorScheme * highlight Folded cterm=italic gui=italic
    "     autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
    "     autocmd ColorScheme * highlight DiagnosticSign ctermbg=235 guibg=NONE
    "
    "     " NvimTree
    "     autocmd ColorScheme * highlight NvimTreeNormal guifg=NONE guibg=NONE
    "     autocmd ColorScheme * highlight NvimTreeEndOfBuffer guifg=#7c6f64 guibg=NONE
    "     " autocmd ColorScheme * highlight NvimTreeFolderName guifg=#7c6f64
    "     " autocmd ColorScheme * highlight NvimTreeOpenedFolderName guifg=#ebdbb2
    "     " autocmd ColorScheme * highlight NvimTreeEmptyFolderName guifg=#ebdbb2
    "     autocmd ColorScheme * highlight NvimTreeOpenedFile guifg=#ebdbb2
    " augroup END
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

-- Change NvimTree folder colors, not yet working, needs to re-source (TODO)
-- vim.cmd [[highlight NvimTreeNormal guifg=NONE guibg=NONE]]
-- vim.cmd [[highlight NvimTreeEndOfBuffer guifg=#7c6f64 guibg=NONE]]
-- vim.cmd [[highlight NvimTreeOpenedFolderName guifg=#7c6f64]]
-- vim.cmd [[highlight NvimTreeEmptyFolderName guifg=#7c6f64]]
