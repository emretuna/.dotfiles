return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    window = {
      border = 'double',
    },
    lsp = { auto_attach = true, preference = 'nvim_lsp' },
  },
  init = function()
    vim.keymap.set('n', '<leader>wn', '<cmd>Navbuddy<cr>', { desc = '[N]avbuddy' })
  end,
}
