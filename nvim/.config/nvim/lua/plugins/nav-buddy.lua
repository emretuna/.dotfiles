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
  config = function(_, opts)
		require('nvim-navbuddy').setup(opts)

    vim.keymap.set('n', '<leader>wn', '<cmd>Navbuddy<cr>', { desc = '[N]avbuddy' })
  end,
}
