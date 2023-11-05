require("nvim-tree").setup({
    hijack_cursor = true,
    auto_reload_on_write = false,
    disable_netrw = false,
    update_focused_file = {
        -- Expand focused file in tree
        enable = true
    },
    -- hijack_directories = {
    --     auto_open = false,
    -- }, git = {
    --   enable = false,
    --   timeout = 1000
    -- },
    view = {
        width = {
            min = 30,
            max = -1,
        },
        cursorline = true,
        centralize_selection = true,
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
vim.cmd [[nnoremap <C-t> :NvimTreeFindFileToggle<CR>]]
-- vim.cmd [[nnoremap <Leader>t :NvimTreeToggle<CR>]]

-- Reveal current file in NvimTree
vim.cmd [[nnoremap <Leader>F :NvimTreeFindFile<CR>]]

-- local function open_nvim_tree()
--   -- open the tree
--   require("nvim-tree.api").tree.open()
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Workaround for getting nvim-tree to play nicely with rmagatti/auto-session
-- Source: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local view = require('nvim-tree.view')
    local is_visible = view.is_visible()

    local api = require('nvim-tree.api')
    if not is_visible then
      api.tree.open()
    end
  end,
})
