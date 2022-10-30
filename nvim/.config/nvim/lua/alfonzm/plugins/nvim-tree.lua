require("nvim-tree").setup({
    hijack_cursor = true,
    auto_reload_on_write = false,
    update_focused_file = {
        -- Expand focused file in tree
        enable = true
    },
    -- hijack_directories = {
    --     auto_open = false,
    -- },
    -- git = {
    --   enable = false,
    --   timeout = 1000
    -- },
    view = {
        adaptive_size = true
    },
    filters = {
        custom = {
            '^\\.git$', 'node_modules', 'vendor'
        },
    },
    renderer = {
        icons = {
            show = {
                folder_arrow = false
            },
            padding = '  ',
            git_placement = 'signcolumn',
            glyphs = {
                git = {
                    unstaged = '+',
                    staged = '+',
                    renamed = 'Ｒ',
                    untracked = '?',
                    deleted = '－',
                    ignored = '！',
                },
            }
        }
    }
})

-- Toggle NvimTree sidebar
vim.cmd [[nnoremap <C-t> :NvimTreeToggle<CR>]]
vim.cmd [[nnoremap <Leader>t :NvimTreeToggle<CR>]]

-- Reveal current file in NvimTree
vim.cmd [[nnoremap <Leader>F :NvimTreeFindFile<CR>]]
