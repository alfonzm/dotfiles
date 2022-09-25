require("nvim-tree").setup({
  hijack_cursor = true,
  auto_reload_on_write = false,
  update_focused_file = {
    enable = true
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
