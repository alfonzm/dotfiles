local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

require('harpoon').setup ({
    menu = {
        width = 150
    },
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = false,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
    }
})

vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
vim.keymap.set('n', '<Leader>e', function() mark.add_file() print("Mark added to Harpoon: " .. vim.fn.expand("%")) end, { desc = "Add current file to Harpoon" })
vim.keymap.set('n', '<Leader>1', function() ui.nav_file(1) end, { desc = "Jump to 1st Harpoon mark" })
vim.keymap.set('n', '<Leader>2', function() ui.nav_file(2) end, { desc = "Jump to 2nd Harpoon mark" })
vim.keymap.set('n', '<Leader>3', function() ui.nav_file(3) end, { desc = "Jump to 3rd Harpoon mark" })
vim.keymap.set('n', '<Leader>4', function() ui.nav_file(4) end, { desc = "Jump to 4th Harpoon mark" })
vim.keymap.set('n', '<Leader>5', function() ui.nav_file(5) end, { desc = "Jump to 5th Harpoon mark" })
vim.keymap.set('n', '<Leader>6', function() ui.nav_file(6) end, { desc = "Jump to 6th Harpoon mark" })

vim.keymap.set('n', '<Leader>[', function() ui.nav_prev() end, { desc = "Jump to previous Harpoon mark" })
vim.keymap.set('n', '<Leader>]', function() ui.nav_next() end, { desc = "Jump to next Harpoon mark" })
