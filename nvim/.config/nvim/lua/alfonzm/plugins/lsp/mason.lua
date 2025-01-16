require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'intelephense',
        'ts_ls',
        'html',
        'emmet_ls',
        'gopls',
    }
})
