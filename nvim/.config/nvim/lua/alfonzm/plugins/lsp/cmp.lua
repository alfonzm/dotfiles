local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp = require('cmp')

-- better autocompletion experience
-- vim.o.completeopt = 'menuone,noselect'

require('luasnip/loaders/from_snipmate').lazy_load()

cmp.setup {
    -- Format the autocomplete menu
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            show_labelDetails = true,
            menu = {
                nvim_lsp = '[LSP]',
                nvim_lua = '[Lua]',
                buffer = '[Buf]',
                ['vim-dadbod-completion'] = '[DB]',
            }
        })
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
        -- Use Tab and shift-Tab to navigate autocomplete menu
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    experimental = {
        -- Set to false so that it won't interfere with Github Copilot
        -- Can set to true if not using Copilot
        ghost_text = false,
    }
}

-- Setup buffer completion for sql
-- Source: https://github.com/kristijanhusak/vim-dadbod-completion
vim.cmd[[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]]
