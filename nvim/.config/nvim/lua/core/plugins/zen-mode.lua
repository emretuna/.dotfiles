return {
  'folke/zen-mode.nvim',
  dependencies = {
    'folke/twilight.nvim',
  },
  init = function()
    vim.keymap.set('n', '<leader>uz', ':ZenMode<cr>', { desc = '[Z]en Mode' })
  end,
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
}
