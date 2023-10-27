local actions = require('telescope.actions')
local lga_actions = require('telescope-live-grep-args.actions')

local wide_layout_config = {
    horizontal = {
        width = 0.95,
        preview_width = 0.4,
    }
}

require('telescope').setup({
    defaults = {
        layout_config = wide_layout_config,
        wrap_results = true,
        mappings = {
            n = {
                -- close Telescope in one Esc keypress
                ['<esc>'] = actions.close,
                ['<C-c>'] = actions.close,
            },
            i = {
                ['<C-d>'] = actions.delete_buffer
            }
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
                '-g',
                '!{**/vendor/*,**/node_modules/*,**/.git/*,**/public/*,**/tmp/*,**/Alfred.alfredpreferences/*}',
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
                '!{**/vendor/*,**/node_modules/*,**/.git/*,**/public/*,**/tmp/*,**/Alfred.alfredpreferences/*}',
            },
            layout_config = wide_layout_config,
        },
        buffers = {
            -- previewer = false,
            -- theme = "dropdown",
            layout_config = wide_layout_config,
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
