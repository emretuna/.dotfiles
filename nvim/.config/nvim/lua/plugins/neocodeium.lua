return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  opts = {
    manual = false,
    silent = true,
    debounce = false,
  },
  init = function()
    vim.keymap.set('i', '<c-y>', function()
      require('neocodeium').accept()
    end)
    vim.keymap.set('i', '<c-w>', function()
      require('neocodeium').accept_word()
    end)
    vim.keymap.set('i', '<c-l>', function()
      require('neocodeium').accept_line()
    end)
    vim.keymap.set('i', '<c-p>', function()
      require('neocodeium').cycle_or_complete(-1)
    end)
    vim.keymap.set('i', '<c-n>', function()
      require('neocodeium').cycle_or_complete()
    end)
  end,
}
