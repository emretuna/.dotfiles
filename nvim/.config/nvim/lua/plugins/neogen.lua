return {
  'danymat/neogen',
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  init = function()
    vim.keymap.set('n', 'g@', ':lua require("neogen").generate()<CR>')
  end,
}
