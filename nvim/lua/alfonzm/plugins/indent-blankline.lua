require("indent_blankline").setup {
  show_current_context = false,
  indent_blankline_use_treesitter = true,
  indent_blankline_show_current_context = false,

  -- Align with bufferline and gitsigns
  indent_blankline_context_char = '▎',
}

vim.cmd[[highlight IndentBlanklineChar guifg=#333333]]