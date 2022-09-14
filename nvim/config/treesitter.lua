require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "yaml",
    "markdown",
    "comment",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "php",
    "regex",
    "typescript",
    "scss",
    "vim",
    "vue",
  },
  highlight = {
    enable = true,
    disable = { "html" },
  },
  indent = {
    enable = true,
  },
}
