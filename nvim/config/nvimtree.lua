require("nvim-tree").setup({
  renderer = {
    highlight_opened_files = "all"
  }
})

-- Toggle NvimTree sidebar
vim.cmd[[nnoremap <C-t> :NvimTreeToggle<CR>]]

-- Reveal current file in NvimTree
vim.cmd[[nnoremap <Leader>f :NvimTreeFindFile<CR>]]
