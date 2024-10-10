return {
  'mistweaverco/kulala.nvim',
  event = 'VeryLazy',
  ft = { 'http', 'rest' },
  opts = {
    default_view = 'headers_body',
  },
  config = function(_, opts)
    require('kulala').setup(opts)

    vim.keymap.set('n', '<leader>h.', ":lua require('kulala').run()<CR>", { desc = 'Http Run', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ht', ":lua require('kulala').toggle_view()<CR>", { desc = 'Http Toggle', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hy', ":lua require('kulala').copy()<CR>", { desc = 'Http Yank', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hp', ":lua require('kulala').jump_prev()<CR>", { desc = 'Http Prev', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hn', ":lua require('kulala').jump_next()<CR>", { desc = 'Http Next', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hq', ":lua require('kulala').close()<CR>", { desc = 'Http Quit', noremap = true, silent = true })
  end,
  vim.filetype.add {
    extension = {
      ['http'] = 'http',
      ['rest'] = 'http',
    },
  },
}
