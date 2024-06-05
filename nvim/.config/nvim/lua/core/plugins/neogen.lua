return {
  'danymat/neogen',
  config = function()
    require('neogen').setup {}
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  vim.keymap.set('n', 'g@', ":lua require('neogen').generate()<CR>", { desc = 'Neogen', noremap = true, silent = true }),
}
