-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('gitsigns').setup {

        max_file_length = vim.g.big_file.lines,
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        attach_to_untracked = false,
      }

      vim.keymap.set('n', ']g', function()
        require('gitsigns').next_hunk()
      end, { silent = true, desc = 'Next Git hunk' })
      vim.keymap.set('n', '[g', function()
        require('gitsigns').prev_hunk()
      end, { silent = true, desc = 'Previous Git hunk' })
      vim.keymap.set('n', '<leader>gl', function()
        require('gitsigns').blame_line()
      end, { silent = true, desc = 'View Git blame' })
      vim.keymap.set('n', '<leader>gL', function()
        require('gitsigns').blame_line { full = true }
      end, { silent = true, desc = 'View full Git blame' })
      vim.keymap.set('n', '<leader>gp', function()
        require('gitsigns').preview_hunk()
      end, { silent = true, desc = 'Preview Git hunk' })
      vim.keymap.set('n', '<leader>gh', function()
        require('gitsigns').reset_hunk()
      end, { silent = true, desc = 'Reset Git hunk' })
      vim.keymap.set('n', '<leader>gr', function()
        require('gitsigns').reset_buffer()
      end, { silent = true, desc = 'Reset Git buffer' })
      vim.keymap.set('n', '<leader>gs', function()
        require('gitsigns').stage_hunk()
      end, { silent = true, desc = 'Stage Git hunk' })
      vim.keymap.set('n', '<leader>gS', function()
        require('gitsigns').stage_buffer()
      end, { silent = true, desc = 'Stage Git buffer' })
      vim.keymap.set('n', '<leader>gu', function()
        require('gitsigns').undo_stage_hunk()
      end, { silent = true, desc = 'Unstage Git hunk' })
      vim.keymap.set('n', '<leader>gd', function()
        require('gitsigns').diffthis()
      end, { silent = true, desc = 'View Git diff' })
    end,
  },
}
