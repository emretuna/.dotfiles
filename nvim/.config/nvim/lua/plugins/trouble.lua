return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  config = function(_, opts)
    require('trouble').setup(opts)

    vim.keymap.set('n', '<leader>x.', '<cmd>Trouble diagnostics toggle<cr>', { desc = '[T]rouble Toggle' })
    vim.keymap.set('n', '<leader>x/', '<cmd>Trouble loclist toggle<cr>', { desc = '[T]rouble Location List' })
    vim.keymap.set('n', '<leader>xb', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = '[T]rouble [B]buffer Diagnostics' })
    vim.keymap.set('n', '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = '[T]rouble [S]ymbols' })
    vim.keymap.set('n', '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = '[T]rouble [L]SP Definitions/References/... ' })
    vim.keymap.set('n', '<leader>xq', '<cmd>Trouble qflist toggle<cr>', { desc = '[T]rouble [Q]uickfix List' })
  end,
}
