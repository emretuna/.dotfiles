return {
  'Exafunction/codeium.nvim',
  event = 'BufRead',
  cmd = 'Codeium',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('codeium').setup {}
  end,
}
