return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-s>'] = false,
        ['<C-t>'] = false,
        ['<M-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
        ['<M-h>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
        ['<M-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in a horizontal split' },
      },
      view_options = {
        show_hidden = true,
      },
      delete_to_trash = true,
      trash_command = 'rm',
    }
    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- Open parent directory in floating window
    vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open directory' })
  end,
}
