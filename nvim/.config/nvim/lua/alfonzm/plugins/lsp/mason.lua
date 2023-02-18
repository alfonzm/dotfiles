require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'intelephense',
        'tsserver',
        'html',
        'emmet_ls',
    }
})
