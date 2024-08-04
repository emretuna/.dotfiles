return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  opts = {
    max_file_length = vim.g.big_file.lines,
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    attach_to_untracked = false,
  },
  init = function()
    vim.keymap.set('n', '<leader>gt', '<cmd>:Gitsigns toggle_current_line_blame<cr>', { desc = '[G]it [T]oggle Blame' })
    vim.keymap.set('n', ']g', function()
      require('gitsigns').next_hunk()
    end, { silent = true, desc = 'Next [G]it Huk' })
    vim.keymap.set('n', '[g', function()
      require('gitsigns').prev_hunk()
    end, { silent = true, desc = 'Previous [G]it Hunk' })
    vim.keymap.set('n', '<leader>gl', function()
      require('gitsigns').blame_line()
    end, { silent = true, desc = '[G]it Blame [L]ine' })
    vim.keymap.set('n', '<leader>gL', function()
      require('gitsigns').blame_line { full = true }
    end, { silent = true, desc = '[G]it Blame [L]ine Full' })
    vim.keymap.set('n', '<leader>gp', function()
      require('gitsigns').preview_hunk()
    end, { silent = true, desc = '[G]it [P]review Hunk' })
    vim.keymap.set('n', '<leader>gh', function()
      require('gitsigns').reset_hunk()
    end, { silent = true, desc = '[G]it Reset [H]unk' })
    vim.keymap.set('n', '<leader>gr', function()
      require('gitsigns').reset_buffer()
    end, { silent = true, desc = '[G]it [R]eset Buffer' })
    vim.keymap.set('n', '<leader>gs', function()
      require('gitsigns').stage_hunk()
    end, { silent = true, desc = '[G]it [S]tage Hunk' })
    vim.keymap.set('n', '<leader>gS', function()
      require('gitsigns').stage_buffer()
    end, { silent = true, desc = '[G]it [S]tage Buffer' })
    vim.keymap.set('n', '<leader>gu', function()
      require('gitsigns').undo_stage_hunk()
    end, { silent = true, desc = '[G]it [U]nstage Hunk' })
    vim.keymap.set('n', '<leader>gd', function()
      require('gitsigns').diffthis()
    end, { silent = true, desc = '[G]it [D]iff' })
  end,
}
