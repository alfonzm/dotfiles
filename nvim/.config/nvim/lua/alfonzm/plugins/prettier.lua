local prettier = require('prettier')

prettier.setup {
    bin = 'prettierd',
    filetypes = {
        'css',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'scss',
        'less',
    }
}

vim.g['prettier#autoformat_ignore_filetypes'] = {'markdown', 'md'}
