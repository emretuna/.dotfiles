return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>n', '<cmd>Navbuddy<cr>', desc = '[N]avbuddy' },
  },
  config = function()
    local navbuddy = require 'nvim-navbuddy'
    navbuddy.setup {
      window = {
        border = 'double',
      },
      lsp = { auto_attach = true, preference = 'nvim_lsp' },
    }
  end,
}
