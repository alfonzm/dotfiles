local actions = require('telescope.actions')
local lga_actions = require('telescope-live-grep-args.actions')

require('telescope').setup({
    defaults = {
        mappings = {
            n = {
                -- close Telescope in one Esc keypress
                ['<esc>'] = actions.close,
                ['<C-c>'] = actions.close,
            },
        },
        file_ignore_patterns = {
            '.git/',
            'node_modules/',
            'vendor/',
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            -- override_generic_sorter = true,
            -- override_file_sorter = true,
            case_mode = 'smart_case',
        },
        live_grep_args = {
            auto_quoting = true,
            mappings = { -- extend mappings
                i = {
                    ["<C-k>"]  = lga_actions.quote_prompt(),
                    ["<C-i>"]  = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
            },
            -- Add hidden so live_grep includes hidden files, see:
            -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim/issues/9#issuecomment-1043376714
            vimgrep_arguments = {
                'rg',
                '--hidden',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
            }
        },
    },
    pickers = {
        find_files = {
            -- hidden = true,
            -- no_ignore = true,
            find_command = {
                'rg',
                '--files',
                '--follow',
                '--no-ignore-vcs',
                '--hidden',
                '-g',
                '!{**/vendor/*,**/node_modules/*,**/.git/*,**/public/*,**/tmp/*}',
            },
        },
        buffers = {
            previewer = false,
            layout_config = {
                width = 80,
                height = 30,
            },
        },
        live_grep = {
            hidden = true,
            no_ignore = true,
        },
        oldfiles = {
            prompt_title = 'History',
        },
    }
})

vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<C-f>', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<C-g>', ':Telescope git_status<CR>')
vim.keymap.set('n', '<Leader>H', ':Telescope oldfiles<CR>')
vim.keymap.set('n', '<Leader>R', ':Telescope treesitter<CR>imethod <Esc>', { desc = 'Search for method in buffer, similar to Sublime Text Cmd+R'})
vim.keymap.set('n', '<Leader>b', ':Telescope buffers<CR>')

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')
