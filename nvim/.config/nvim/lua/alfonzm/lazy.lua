local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- General Plugins
    { 'nvim-lua/plenary.nvim'  },
    { 'tpope/vim-surround'     },
    { 'tpope/vim-repeat'       },
    { 'tpope/vim-unimpaired'   },
    { 'tpope/vim-speeddating'  },
    { 'tpope/vim-eunuch'       },
    { 'moll/vim-bbye'          },
    { 'christoomey/vim-tmux-navigator' },
    { 'nelstrom/vim-visual-star-search' },
    { 'mg979/vim-visual-multi' },

    -- Color schemes
    {
        --  'morhetz/gruvbox'
        --  'eddyekofo94/gruvbox-flat.nvim'
        --  'luisiacc/gruvbox-baby', {'branch': 'main'}
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.api.nvim_exec(
                [[
                    let g:gruvbox_material_diagnostic_text_highlight = 1
                    let g:gruvbox_material_diagnostic_line_highlight = 1
                    let g:gruvbox_material_diagnostic_virtual_text   = 1
                ]],
                false
            )

            vim.g.gruvbox_material_background = 'medium'
            vim.g.gruvbox_material_foreground = 'original'
            vim.g.gruvbox_material_better_performance = 1
            vim.cmd([[colorscheme gruvbox-material]])
        end
    },

    -- Undotree
    {
        'mbbill/undotree',
        config = function()
            require('alfonzm.plugins.undotree')
        end
    },

    -- Floatterm
    {
        'voldikss/vim-floaterm',
        config = function()
            require('alfonzm.plugins.vim-floaterm')
        end
    },


    -- gS or gD to smart split/join lines
    {
        'AndrewRadev/splitjoin.vim',
        config = function ()
            require('alfonzm.plugins.splitjoin')
        end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        dependencies = {
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function ()
            require('alfonzm.plugins.telescope')
        end
    },

    -- Change case, etc
    { 'tpope/vim-abolish' },

    {
        'junegunn/vim-easy-align',
        config = function ()
            require('alfonzm.plugins.vim-easy-align')
        end
    },

    -- Comments
    {
        'numToStr/Comment.nvim',
        config = function()
            require('alfonzm.plugins.comment')
        end
    },

    -- Editorconfig (order is impt here, sleuth is only fallback)
    --  'tpope/vim-sleuth'
    { 'editorconfig/editorconfig-vim' },

    -- Git Fugitive
    {
        'tpope/vim-fugitive',
        dependencies = 'tpope/vim-rhubarb',
        config = function()
            require('alfonzm.plugins.vim-fugitive')
        end
    },

    -- Git commit browser (:GV)
    { 'junegunn/gv.vim' },

    -- Git Signs
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('alfonzm.plugins.gitsigns')
        end
    },

    -- Git Blamer
    {
        'APZelos/blamer.nvim',
        config = function()
            require('alfonzm.plugins.blamer')
        end
    },

    -- Git diffs
    {
        'TimUntersberger/neogit',
        config = function()
            require('alfonzm.plugins.neogit')
        end
    },

    -- Persistence
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
        },
    },

    -- -- Session
    -- {
    --     'rmagatti/auto-session',
    --     config = function ()
    --         require('alfonzm.plugins.auto-session')
    --     end
    -- },

    -- Vim Test
    {
        'vim-test/vim-test',
        config = function()
            require('alfonzm.plugins.vim-test')
        end,
    },

    -- Fuzzy File Finder
    {
        'junegunn/fzf',
        build = ':call fzf#install()',
        config = function()
            require('alfonzm.plugins.fzf')
        end,
    },

    {
        'junegunn/fzf.vim',
        config = function()
            require('alfonzm.plugins.fzf')
        end,
    },

    -- Icons
    { 'kyazdani42/nvim-web-devicons' },

    -- LSP servers
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('alfonzm.plugins.lsp.mason')
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        -- event = 'BufRead',
        config = function()
            require('alfonzm.plugins.lsp.lspconfig')
        end,
        dependencies = {
            { 'folke/lsp-colors.nvim' },
        },
    },

    -- Prettier
    --  {
    --     'prettier/vim-prettier',
    --     build = 'npm install',
    --     config = function()
    --         require('alfonzm.plugins.vim-prettier')
    --     end
    -- }

    -- Null LS
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('alfonzm.plugins.null_ls')
        end
    },
    {
        'MunifTanjim/prettier.nvim',
        config = function()
            require('alfonzm.plugins.prettier')
        end
    },

    -- Code Action Menu
    -- ({
    --     'weilbith/nvim-code-action-menu',
    --     cmd = 'CodeActionMenu',
    -- })

    -- LSP Snippets
    {
        'L3MON4D3/LuaSnip',
        config = function()
            require('alfonzm.plugins.luasnips')
        end,
    },

    -- LSP Completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
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
    },

    -- PHP
    {
        'phpactor/phpactor',
        branch = 'master',
        ft = 'php',
        build = 'composer install --no-dev -o',
        config = function()
            require('alfonzm.plugins.phpactor')
        end,
    },

    --  Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'windwp/nvim-ts-autotag',
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'JoosepAlviste/nvim-ts-context-commentstring',
            -- 'nvim-treesitter/nvim-treesitter-context',
        },
        config = function()
            require('alfonzm.plugins.treesitter')
        end,
    },

    -- Status Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            'nvim-lua/lsp-status.nvim',
        },
        config = function()
            require('alfonzm.plugins.lualine')
        end,
    },

    -- Autopairs
    {
        'windwp/nvim-autopairs',
        opts = {
            map_cr = true,
        }
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('alfonzm.plugins.bufferline')
        end,
    },

    -- Nvim Tree
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('alfonzm.plugins.nvim-tree')
        end,
    },

    -- -- Color Highlighter
    -- {
    --     'norcalli/nvim-colorizer.lua',
    --     config = true,
    -- },

    -- Markdown
    { 'godlygeek/tabular' },
    {
        'preservim/vim-markdown',
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_auto_insert_bullets = 1
            vim.g.vim_markdown_new_list_item_indent = 0
        end
    },
    {
        'iamcco/markdown-preview.nvim',
        build = function() vim.fn['mkdp#util#install']() end,
    },

    -- Syntax Highlighters
    --  'HerringtonDarkholme/yats.vim'
    { 'MaxMEllon/vim-jsx-pretty' },
    { 'styled-components/vim-styled-components' },

    -- Project Configuration
    {
        'tpope/vim-projectionist',
        dependencies = 'tpope/vim-dispatch',
        config = function()
            require('alfonzm.plugins.projectionist')
        end,
    },

    -- Rest NVIM
    {
        'diepm/vim-rest-console',
        config = function()
            require('alfonzm.plugins.vim-rest-console')
        end,
    },

    -- Rest.nvim
    {
        "rest-nvim/rest.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        commit = '8b62563',
        config = function()
            require('alfonzm.plugins.rest-nvim')
        end,
    },

    -- Flash
    {
        'folke/flash.nvim',
        config = function()
            require('alfonzm.plugins.flash')
        end,
    },

    -- Which-key
    {
        'folke/which-key.nvim',
        config = function()
            require('alfonzm.plugins.which-key')
        end
    },

    -- Github Copilot
    {
        'github/copilot.vim',
        config = function()
            require('alfonzm.plugins.copilot')
        end,
    },

    -- CodeGPT
    { 'MunifTanjim/nui.nvim' },
    {
        'dpayne/CodeGPT.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require('alfonzm.plugins.codegpt')
        end,
    },

    -- Oil
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Harpoon
    {
        'ThePrimeagen/harpoon',
        config = function()
            require('alfonzm.plugins.harpoon')
        end,
    },

    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        -- cmd = {
        --     'DBUI',
        --     'DBUIToggle',
        --     'DBUIAddConnection',
        --     'DBUIFindBuffer',
        -- },
        config = function()
            require('alfonzm.plugins.vim-dadbod')
        end,
    }
}

require('lazy').setup(plugins, {})
