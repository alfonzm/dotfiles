local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
    use 'nvim-lua/plenary.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-speeddating'
    use 'tpope/vim-eunuch'
    use 'moll/vim-bbye'
    use 'mbbill/undotree'
    use 'christoomey/vim-tmux-navigator'
    use 'nelstrom/vim-visual-star-search'
    use {
        'voldikss/vim-floaterm',
        config = function()
            require('alfonzm.plugins.vim-floaterm')
        end
    }

    -- gS or gD to smart split/join lines
    use {
        'AndrewRadev/splitjoin.vim',
        config = function ()
            require('alfonzm.plugins.splitjoin')
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = {
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },
        config = function ()
            require('alfonzm.plugins.telescope')
        end
    }

    -- Change case, etc
    use 'tpope/vim-abolish'

    use {
        'junegunn/vim-easy-align',
        config = function ()
            require('alfonzm.plugins.vim-easy-align')
        end
    }

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('alfonzm.plugins.comment')
        end
    }

    -- Editorconfig (order is impt here, sleuth is only fallback)
    -- use 'tpope/vim-sleuth'
    use 'editorconfig/editorconfig-vim'

    -- Git Fugitive
    use({
        'tpope/vim-fugitive',
        requires = 'tpope/vim-rhubarb',
        config = function()
            require('alfonzm.plugins.vim-fugitive')
        end
    })

    -- Git commit browser (:GV)
    use 'junegunn/gv.vim'

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
    use({
        'TimUntersberger/neogit',
        config = function()
            require('alfonzm.plugins.neogit')
        end
    })
    use({
        'sindrets/diffview.nvim',
        config = function()
            require('alfonzm.plugins.diffview')
        end
    })

    -- Open Browser
    use({
        'tyru/open-browser-github.vim',
        requires = 'tyru/open-browser.vim',
        config = function()
            require('alfonzm.plugins.open-browser')
        end
    })

    -- Session
    use ({
        'rmagatti/auto-session',
        config =function ()
            require('alfonzm.plugins.auto-session')
        end
    })

    -- Vim Test
    use({
        'vim-test/vim-test',
        config = function()
            require('alfonzm.plugins.vim-test')
        end,
    })

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
    -- use 'morhetz/gruvbox'
    use 'sainnhe/gruvbox-material'
    -- use 'eddyekofo94/gruvbox-flat.nvim'
    -- use 'luisiacc/gruvbox-baby', {'branch': 'main'}

    -- LSP servers
    use {
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('alfonzm.plugins.lsp.mason')
        end
    }

    -- LSP
    use({
        'neovim/nvim-lspconfig',
        -- event = 'BufRead',
        config = function()
            require('alfonzm.plugins.lsp.lspconfig')
        end,
        requires = {
            { 'folke/lsp-colors.nvim' },
        },
    })

    -- Prettier
    -- use {
    --     'prettier/vim-prettier',
    --     run = 'npm install',
    --     config = function()
    --         require('alfonzm.plugins.vim-prettier')
    --     end
    -- }

    -- Null LS
    use({
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('alfonzm.plugins.null_ls')
        end
    })
    use({
        'MunifTanjim/prettier.nvim',
        config = function()
            require('alfonzm.plugins.prettier')
        end
    })

    -- Code Action Menu
    -- use({
    --     'weilbith/nvim-code-action-menu',
    --     cmd = 'CodeActionMenu',
    -- })

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
            'nvim-treesitter/nvim-treesitter-textobjects',
            'JoosepAlviste/nvim-ts-context-commentstring',
            -- 'nvim-treesitter/nvim-treesitter-context',
        },
        config = function()
            require('alfonzm.plugins.treesitter')
            -- require('nvim-treesitter').setup()
        end,
    })

    -- Status Line
    use({
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            'nvim-lua/lsp-status.nvim',
        },
        config = function()
            require('alfonzm.plugins.lualine')
        end,
    })

    -- Indent blankline
    -- use({
    --     'lukas-reineke/indent-blankline.nvim',
    --     config = function()
    --         require('alfonzm.plugins.indent-blankline')
    --     end,
    -- })

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

    -- Nvim Tree
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
            require 'colorizer'.setup()
        end
    })

    -- Markdown
    use 'godlygeek/tabular'
    use({
        'preservim/vim-markdown',
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_auto_insert_bullets = 1
            vim.g.vim_markdown_new_list_item_indent = 0
        end
    })
    use({
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
    })

    -- Syntax Highlighters
    -- use 'HerringtonDarkholme/yats.vim'
    use 'MaxMEllon/vim-jsx-pretty'
    use 'styled-components/vim-styled-components'

    -- Goyo (focus mode)
    use({
        'junegunn/goyo.vim',
        config = function()
            require('alfonzm.plugins.goyo')
        end
    })

    -- use({
    --     'glepnir/dashboard-nvim',
    --     config = function ()
    --         require('alfonzm.plugins.dashboard-nvim')
    --     end
    -- })

    -- use 'mhinz/vim-startify'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

    -- Project Configuration.
    use({
        'tpope/vim-projectionist',
        requires = 'tpope/vim-dispatch',
        config = function()
            require('alfonzm.plugins.projectionist')
        end,
    })

    -- Rest NVIM
    use({
        'diepm/vim-rest-console',
        config = function()
            require('alfonzm.plugins.vim-rest-console')
        end,
    })

    -- Rest.nvim
    use {
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        commit = '8b62563',
        config = function()
            require('alfonzm.plugins.rest-nvim')
        end,
    }

    use {
        'folke/flash.nvim',
        config = function()
            require('alfonzm.plugins.flash')
        end,
    }

    use {
        'folke/which-key.nvim',
        config = function()
            require('alfonzm.plugins.which-key')
        end
    }
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})

-- Automatically run :PackerCompile whenever plugins.lua is updated
-- vim.cmd([[
--     augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--     augroup end
-- ]])
