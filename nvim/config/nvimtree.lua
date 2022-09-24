require("nvim-tree").setup({
  renderer = {
    highlight_opened_files = "all",
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
