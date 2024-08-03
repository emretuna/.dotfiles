return {
  'mistweaverco/kulala.nvim',
  evet = 'VeryLazy',
  ft = { 'http', 'rest' },
  config = function()
    -- Setup is required, even if you don't pass any options
    require('kulala').setup {}

    vim.keymap.set('n', '<leader>h.', ":lua require('kulala').run()<CR>", { desc = '[H]ttp Run', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ht', ":lua require('kulala').toggle_view()<CR>", { desc = '[H]ttp [T]oggle', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hy', ":lua require('kulala').copy()<CR>", { desc = '[H]ttp [Y]ank', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hp', ":lua require('kulala').jump_prev()<CR>", { desc = '[H]ttp [P]rev', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hn', ":lua require('kulala').jump_next()<CR>", { desc = '[H]ttp [N]ext', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>hq', ":lua require('kulala').close()<CR>", { desc = '[H]ttp [Q]uit', noremap = true, silent = true })
  end,
  vim.filetype.add {
    extension = {
      ['http'] = 'http',
      ['rest'] = 'http',
    },
  },
}
