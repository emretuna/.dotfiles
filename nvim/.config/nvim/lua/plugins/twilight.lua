return {
  'folke/twilight.nvim',
  config = function()
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    vim.keymap.set('n', '<leader>ut', '<cmd>Twilight<cr>', { desc = '[T]wilight' })
  end,
}
