require("nvim-tree").setup({
  hijack_cursor = true,
  auto_reload_on_write = false,
  create_in_closed_folder = true,
  update_focused_file = {
    enable = true
  },
  git = {
    enable = false,
    -- timeout = 1000
  },
  filters = {
    custom = {
      '.git', 'node_modules', 'vendor'
    }
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
vim.cmd[[nnoremap <C-t> :NvimTreeToggle<CR>]]
vim.cmd[[nnoremap <Leader>t :NvimTreeToggle<CR>]]

-- Reveal current file in NvimTree
vim.cmd[[nnoremap <Leader>f :NvimTreeFindFile<CR>]]
