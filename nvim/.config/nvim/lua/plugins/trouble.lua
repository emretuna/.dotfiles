return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  init = function()
    vim.keymap.set('n', '<leader>t.', '<cmd>Trouble diagnostics toggle<cr>', { desc = '[T]rouble Toggle' })
    vim.keymap.set('n', '<leader>t/', '<cmd>Trouble loclist toggle<cr>', { desc = '[T]rouble Location List' })
    vim.keymap.set('n', '<leader>tb', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = '[T]rouble [B]buffer Diagnostics' })
    vim.keymap.set('n', '<leader>ts', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = '[T]rouble [S]ymbols' })
    vim.keymap.set('n', '<leader>tl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = '[T]rouble [L]SP Definitions/References/... ' })
    vim.keymap.set('n', '<leader>tq', '<cmd>Trouble qflist toggle<cr>', { desc = '[T]rouble [Q]uickfix List' })
  end,
}
