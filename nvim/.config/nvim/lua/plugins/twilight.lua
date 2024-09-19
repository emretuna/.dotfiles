return {
  'folke/twilight.nvim',
  opts = {},
  config = function(_, opts)
		require('twilight').setup(opts)

    vim.keymap.set('n', '<leader>ut', '<cmd>Twilight<cr>', { desc = '[T]wilight' })
  end,
}
