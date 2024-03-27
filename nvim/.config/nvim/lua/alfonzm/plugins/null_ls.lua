local null_ls = require('null-ls')

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            -- vim.cmd('nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>')

            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

            -- format on save
            -- vim.cmd('autocmd BufWritePost <buffer> lua vim.lsp.buf.format()')
        end

        -- if client.server_capabilities.documentRangeFormattingProvider then
        --     vim.cmd('xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>')
        -- end
    end,
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.golines,
        -- null_ls.builtins.diagnostics.eslint_d.with({
        --     diagnostics_format = '[eslint] #{m} (#{c})'
        -- }),
    }
})
