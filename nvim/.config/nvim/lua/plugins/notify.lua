return {
  'rcarriga/nvim-notify',
  opts = {
    stages = 'static',
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
  config = function(_, opts)
    require('notify').setup(opts)

    vim.keymap.set('n', '<leader>mn', function()
      require('notify').dismiss { silent = true, pending = true }
    end, { desc = 'Dismiss All Notifications' })
  end,
}
