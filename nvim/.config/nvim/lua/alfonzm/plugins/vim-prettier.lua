-- Toggle this auto cmd to enable/disable autoformat on save
vim.api.nvim_command([[
  autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx PrettierAsync
]])

vim.g['prettier#autoformat_require_pragma'] = 0
vim.g['prettier#exec_cmd_path'] = 'prettierd'
vim.g['prettier#config#use_local_config'] = 1
