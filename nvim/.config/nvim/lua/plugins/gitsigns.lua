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
  config = function(_, opts)
    require('gitsigns').setup(opts)

    vim.keymap.set('n', '<leader>gt', '<cmd>:Gitsigns toggle_current_line_blame<cr>', { desc = 'Git Toggle Blame' })
    vim.keymap.set('n', ']g', function()
      require('gitsigns').next_hunk()
    end, { silent = true, desc = 'Next Git Huk' })
    vim.keymap.set('n', '[g', function()
      require('gitsigns').prev_hunk()
    end, { silent = true, desc = 'Previous Git Hunk' })
    vim.keymap.set('n', '<leader>gl', function()
      require('gitsigns').blame_line()
    end, { silent = true, desc = 'Git Blame Line' })
    vim.keymap.set('n', '<leader>gL', function()
      require('gitsigns').blame_line { full = true }
    end, { silent = true, desc = 'Git Blame Line Full' })
    vim.keymap.set('n', '<leader>gp', function()
      require('gitsigns').preview_hunk()
    end, { silent = true, desc = 'Git Preview Hunk' })
    vim.keymap.set('n', '<leader>gh', function()
      require('gitsigns').reset_hunk()
    end, { silent = true, desc = 'Git Reset Hunk' })
    vim.keymap.set('n', '<leader>gr', function()
      require('gitsigns').reset_buffer()
    end, { silent = true, desc = 'Git Reset Buffer' })
    vim.keymap.set('n', '<leader>gs', function()
      require('gitsigns').stage_hunk()
    end, { silent = true, desc = 'Git Stage Hunk' })
    vim.keymap.set('n', '<leader>gS', function()
      require('gitsigns').stage_buffer()
    end, { silent = true, desc = 'Git Stage Buffer' })
    vim.keymap.set('n', '<leader>gu', function()
      require('gitsigns').undo_stage_hunk()
    end, { silent = true, desc = 'Git Unstage Hunk' })
    vim.keymap.set('n', '<leader>gd', function()
      require('gitsigns').diffthis()
    end, { silent = true, desc = 'Git Diff' })
  end,
}
