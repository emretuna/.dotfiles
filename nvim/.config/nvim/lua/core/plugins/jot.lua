return {
  'letieu/jot.lua',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('jot').setup {
      -- your configuration
    }
  end,
  vim.keymap.set('n', '<leader>wj', function()
    require('jot').open()
  end, { desc = '[J]ot' }),
}
