return {
  'folke/twilight.nvim',
  opts = {},
  config = function(_, opts)
    require('twilight').setup(opts)

    vim.keymap.set('n', '<leader>mt', '<cmd>Twilight<cr>', { desc = 'Twilight' })
  end,
}
