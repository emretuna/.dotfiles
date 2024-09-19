return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  opts = {
    columns = { 'icon' },
    keymaps = {
      ['<Esc><Esc>'] = 'actions.close',
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
    -- trash_command = 'rm',
    float = {
      -- Padding around the floating window
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = 'rounded',
      win_options = {
        winblend = 0,
        winhighlight = 'NormalFloat:Normal,FloatBorder:Normal',
      },
      preview_split = 'right',
    },
  },
  config = function(_, opts)
		require('oil').setup(opts)

    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- Open parent directory in floating window
    vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open directory' })
  end,
}
