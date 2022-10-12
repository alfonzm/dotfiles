local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup({ function(use)
    -- General Plugins
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'moll/vim-bbye'

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('alfonzm.plugins.comment')
        end
    }

    -- Editorconfig (order is impt here, sleuth is only fallback)
    use 'tpope/vim-sleuth'
    use 'editorconfig/editorconfig-vim'

    -- Git Fugitive
    use({
        'tpope/vim-fugitive',
        requires = 'tpope/vim-rhubarb',
        cmd = 'G',
    })

    -- Git Signs
    use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require('alfonzm.plugins.gitsigns')
        end
    })

    -- Git Blamer
    use({
        'APZelos/blamer.nvim',
        config = function()
            require('alfonzm.plugins.blamer')
        end
    })

    -- Git diffs
    use 'TimUntersberger/neogit'
    use 'sindrets/diffview.nvim'

    -- Fuzzy File Finder
    use({
        'junegunn/fzf',
        run = ':call fzf#install()',
        config = function()
            require('alfonzm.plugins.fzf')
        end,
    })

    use({
        'junegunn/fzf.vim',
        config = function()
            require('alfonzm.plugins.fzf')
        end,
    })

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Color schemes
    use 'morhetz/gruvbox'
    use 'sainnhe/gruvbox-material'
    -- use 'eddyekofo94/gruvbox-flat.nvim'
    -- use 'luisiacc/gruvbox-baby', {'branch': 'main'}

    -- LSP
    use({
        'neovim/nvim-lspconfig',
        -- event = 'BufRead',
        config = function()
            require('alfonzm.plugins.lsp.lspconfig')
        end,
        requires = {
            {
                'folke/lsp-colors.nvim'
            },
        },
    })

    use({
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    })

    -- LSP Snippets
    use({
        'L3MON4D3/LuaSnip',
        config = function()
            require('alfonzm.plugins.luasnip')
        end,
    })

    -- LSP Completion
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-buffer',
            -- 'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
            'jessarcher/cmp-path',
            'onsails/lspkind-nvim',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require('alfonzm.plugins.lsp.cmp')
        end,
    })

    -- PHP
    use({
        'phpactor/phpactor',
        branch = 'master',
        ft = 'php',
        run = 'composer install --no-dev -o',
        config = function()
            require('alfonzm.plugins.phpactor')
        end,
    })

    --  Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'windwp/nvim-ts-autotag',
            'nvim-treesitter/playground',
            -- 'nvim-treesitter/nvim-treesitter-textobjects',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = function()
            require('alfonzm.plugins.treesitter')
            -- require('nvim-treesitter').setup()
        end,
    })

    -- Status Line
    use({
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('alfonzm.plugins.lualine')
        end,
    })

    -- Indent blankline
    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('alfonzm.plugins.indent-blankline')
        end,
    })

    -- Autopairs
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    })

    -- Bufferline
    use({
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('alfonzm.plugins.bufferline')
        end,
    })

    -- File Tree
    use({
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('alfonzm.plugins.nvim-tree')
        end,
    })

    -- Color Highlighter
    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    })

    -- Markdown
    use 'godlygeek/tabular'
    use({
        'preservim/vim-markdown',
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
        end
    })

    use({
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
    })

    -- Syntax Highlighters
    use 'HerringtonDarkholme/yats.vim'
    use 'MaxMEllon/vim-jsx-pretty'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
    display = {
        open_fn = require('packer.util').float,
    }
}})

-- Automatically run :PackerCompile whenever plugins.lua is updated
-- vim.cmd([[
--     augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--     augroup end
-- ]])

