-- Ctrl+] to cycle to next suggestion if available
vim.keymap.set('i', '<C-]>', '<Plug>(copilot-next)')

-- Ctrl+j to accept copilot completion
vim.cmd[[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]

-- disable tab Accept for copilot
vim.g.copilot_no_tab_map = true
