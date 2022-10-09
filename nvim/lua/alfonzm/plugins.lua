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
    -- use 'editorconfig/editorconfig-vim'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-sleuth'
    use 'moll/vim-bbye'

    -- Fuzzy File Finder
    use({
        "junegunn/fzf",
        run = ":call fzf#install()",
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

    -- Color Highlighter
    -- use 'skammer/vim-css-color'

    -- Completion
    use 'hrsh7th/nvim-cmp' -- Main autocompletion plugin
    use 'hrsh7th/cmp-buffer' -- Source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- Dependency of nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Autocomplete snippets
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completion source
    use 'onsails/lspkind-nvim' -- Autocompletion icons/formatting

    -- LSP
    use 'neovim/nvim-lspconfig'

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

