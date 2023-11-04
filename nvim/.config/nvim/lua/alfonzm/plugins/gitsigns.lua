require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage all hunks in current buffer' })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo the last stage_hunk'})
    map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset entire buffer' })
    map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' }) -- TODO: Improve preview UI
    map('n', '<leader>hb', function() gs.blame_line { full = false } end, { desc = 'Toggle blame line for current line' })
    -- map('n', '<leader>tb', gs.toggle_current_line_blame )
    -- map('n', '<leader>hd', gs.diffthis)
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
