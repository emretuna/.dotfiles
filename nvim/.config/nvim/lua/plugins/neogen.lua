return {
  'danymat/neogen',
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  config = function()
    vim.keymap.set('n', 'g@', ':lua require("neogen").generate()<CR>')
  end,
}
