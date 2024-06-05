return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>t.',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[T]rouble Toggle',
    },
    {
      '<leader>t/',
      '<cmd>Trouble loclist toggle<cr>',
      desc = '[T]rouble Location List',
    },
    {
      '<leader>tb',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics',
    },
    {
      '<leader>ts',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = '[T]rouble [S]ymbols',
    },
    {
      '<leader>tl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = '[T]rouble [L]SP Definitions / references / ...',
    },
    {
      '<leader>tq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = '[T]rouble [Q]uickfix List',
    },
  },
}
