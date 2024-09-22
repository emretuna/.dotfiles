return {
  'danymat/neogen',
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  opts = {},
  config = function(_, opts)
    require('neogen').setup(opts)
    vim.keymap.set('n', 'g@', ':lua require("neogen").generate()<CR>', { desc = 'Neogen Generate Annotations' })
  end,
}
