-- Make sure the OPENAI_API_KEY environment variable is set

vim.keymap.set('v', '<Leader>e', ":Chat explain<CR>", { desc = 'Let GPT explain code' })
vim.keymap.set('v', '<Leader>c', ":Chat ", { desc = 'Instruct GPT to edit code' })
