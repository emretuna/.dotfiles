return {
  'folke/twilight.nvim',
  opts = {},
  init = function()
    vim.keymap.set('n', '<leader>ut', '<cmd>Twilight<cr>', { desc = '[T]wilight' })
  end,
}
