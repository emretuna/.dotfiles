return {
  'folke/zen-mode.nvim',
  dependencies = {
    'folke/twilight.nvim',
  },
  opts = {
    plugins = {
      twilight = {
        enabled = true,
      },
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function(_, opts)
    require('zen-mode').setup(opts)

    vim.keymap.set('n', '<leader>mz', ':ZenMode<cr>', { desc = 'Zen Mode' })
  end,
}
